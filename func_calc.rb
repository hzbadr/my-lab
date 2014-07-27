num  = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]
num_s = %w(zero one two three four five six seven eight nine)

num.zip(num_s).each do |n, s|
  define_method s do |calc=nil|
    calc.nil? ? n : calc.(n)
  end
end

[[:plus, :+], [:minus, :-], [:times, :*], [:divided_by, :/]].each do |s, c|
  define_method s do |number|
    ->(x){ x.send(c, number)}
  end
end

require 'minitest/spec'
require 'minitest/autorun'

describe "calculations" do
  it "passes" do
    five(minus(three)).must_equal two
    five(plus(two)).must_equal seven
  end
end