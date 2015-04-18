def solution(digits)
  return digits.to_i if digits.length <= 5
  return digits[1..-1].to_i if digits[0] == "0"
  max_digit = digits.chars.to_a[0..-5].max.to_i
  digits.scan(/(?=(#{max_digit}\d{4}))/).to_a.max.to_i
end


require 'minitest/spec'
require 'minitest/autorun'

describe "solution" do
  it "passes" do
    solution("1").must_equal 1
    solution("12345").must_equal 12345
    solution("123451").must_equal 23451
    solution("98979634").must_equal 98979
    solution("123454321").must_equal 54321
    solution("12345454321").must_equal 54543
    solution("12345454821").must_equal 54821
    solution("12344325213").must_equal 44325
    solution("123451234512345").must_equal 51234
    solution("01234").must_equal 1234 # fix hexa
  end
end
