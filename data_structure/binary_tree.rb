require 'minitest/autorun'

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    self.data = data
    self.left = nil
    self.right = nil
  end

  def << node
    if node.data <= data
      n = :left
    else
      n = :right
    end

    if self.send(n)
      self.send(n) << node
    else
      self.send("#{n}=", node)
    end

  end

  def print_tree(offset)
    puts "#{" " * (100 + offset)} #{self.data}" if self.data
    puts self.right.print_tree(offset + 8) if self.right
    puts self.left.print_tree(offset - 4) if self.left
  end

  def lookup(val) 
    return true if val == data

    if val <= data
      return false if left.nil?
      left.lookup(val) 
    else
      return false if right.nil?
      right.lookup(val) 
    end
  end

end


class TestNode < Minitest::Test

  def setup
    @btree = Node.new(6)
  end

  def test_root_node_data
    assert_equal @btree.data, 6 
  end

  def test_insert_node
    @btree << Node.new(5)
    assert_equal @btree.left.data, 5
  end
  
  def test_print_tree
    @btree << Node.new(10)
    @btree << Node.new(7)
    @btree << Node.new(9)
    @btree << Node.new(4)
    @btree << Node.new(11)
    @btree << Node.new(1)
    @btree << Node.new(3)
    #@btree.print_tree(100)
  end

  def test_lookup
    @btree << Node.new(10)
    @btree << Node.new(7)
    @btree << Node.new(9)
    @btree << Node.new(4)
    @btree << Node.new(11)
    @btree << Node.new(1)
    @btree << Node.new(3)
    assert @btree.lookup(3)
    refute @btree.lookup(30)
  end

end

require 'benchmark'
arr = []

puts Benchmark.measure { 
  arr = [*1..1000000].shuffle
}

btree = Node.new(arr[0])
arr.each do |i|
  btree << Node.new(i)
end

puts "Adding new node to BinaryTree at the end."
puts Benchmark.measure {
  btree << Node.new(1000001)
}

puts "Adding new node to BinaryTree at the beginnig."
puts Benchmark.measure {
  btree << Node.new(-1)
}

puts "Adding new element to array."
puts Benchmark.measure {
  arr << 1000001
}

puts "Find node in BinaryTree."
puts Benchmark.measure {
  btree.lookup(865875)
}

puts "lookup array."
puts Benchmark.measure {
  arr.include? 865875
}

