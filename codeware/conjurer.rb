#V1
class Conjurer
  def self.conjure(name, block)
    define_method name do
      block.call
    end
  end
end

#V2
class Conjurer
  def self.conjure(name, block)
    define_method(name, block)
  end
end

require 'minitest/spec'
require 'minitest/autorun'

describe Conjurer do
  it "passes" do
    Conjurer.conjure(:one_through_five, ->{(1..5).to_a})
    Conjurer.new.one_through_five.must_equal [1, 2, 3, 4, 5]
  end
end
