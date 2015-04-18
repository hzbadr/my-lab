def matrix_mult(a, b)
  b = b.reduce(:zip).map(&:flatten)
  a.collect do |r|
    b.collect do |c|
      r.zip(c).map{|x| x.reduce(:*)}.reduce(:+)
    end
  end
end

require 'minitest/spec'
require 'minitest/autorun'

describe "matrix_mult" do
  it "passes" do
    matrix_mult([[1, 2], 
                 [3, 2]], 
                [[3, 2], 
                 [1, 1]]).must_equal [[5, 4], [11, 8]]
    matrix_mult([[1, 2, 3], 
                 [3, 2, 1]], 
                [[3, 2], 
                 [1, 1],
                 [2, 3]]).must_equal [[11, 13], [13, 11]]
  end
end
