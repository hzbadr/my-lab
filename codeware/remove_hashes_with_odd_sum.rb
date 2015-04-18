def remove_odd_hashes(array, key_1, key_2)
  array.select do |h|
    (h[key_1] + h[key_2]).even?
  end
end

require 'minitest/spec'
require 'minitest/autorun'

describe "remove_odd_hashes" do
  it "passes" do
    remove_odd_hashes(
      [ {a: 5, b: 5}, 
        {a: 3, b: 4}, 
        {a: 2, b: 0}, 
        {a: 2, b: 1}], 
      :a, :b).must_equal  [{a: 5, b: 5}, {a: 2, b: 0}]
  end
end
