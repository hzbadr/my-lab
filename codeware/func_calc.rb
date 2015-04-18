num  = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
num_s = %w(zero one two three four five six seven eight nine)

num.zip(num_s).each do |n, s|
  define_method s do |calc=nil|
    calc.nil? ? n.to_f : calc.(n)
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

#Another smart solution
# class Object
#   %w[zero one two three four five six seven eight nine].each_with_index do |name, n|
#     define_method(name) do |args = nil|
#       args ? n.send(*args) : n.to_f
#     end
#   end
  
#   %w[plus + minus - times * divided_by /].each_slice(2) do |name, symbol|
#     define_method(name) do |n|
#       [symbol, n]
#     end
#   end
# end