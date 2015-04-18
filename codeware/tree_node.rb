class TreeNode
  attr_accessor :left
  attr_accessor :right
  attr_reader :value

  def initialize(left, value, right)
    @left, @right, @value = left, right, value 
  end

  def children
    [@left, @right]
  end
end

# return the array containing the tree levels, from root to last level.
def tree_by_levels(node)
  return [] if node.nil?

  levels = [node]
  levels.each do |n|
    levels << n.left if n.left
    levels << n.right if n.right
  end 

 levels.map(&:value)
end


tree =  TreeNode.new(
          TreeNode.new(
            TreeNode.new(nil, 1, nil),
            8, 
            TreeNode.new(nil, 3, nil)
          ), 
          2, 
          TreeNode.new(
            TreeNode.new(nil, 4, nil),
            9, 
            TreeNode.new(nil, 5, nil)
          )
        )
# puts tree

# puts tree_by_levels(tree).inspect

require 'minitest/spec'
require 'minitest/autorun'

describe "tree_by_levels" do
  it "passes" do
    tree_by_levels(tree).must_equal [2,8,9,1,3,4,5]
  end
end
