class Node
  attr_accessor :next
end
#v1
def loop_size(node)
  nodes = {node: 0}
  i = 1
  while true do
    unless nodes[node.next].nil?
      return i - nodes[node.next]
    end

    nodes[node.next] = i
    node = node.next
    i += 1
  end
  
  return -1
end
#v2
def loop_size(node)
  lo = 1
  nodes = {node => lo }
  while node.next
    if nodes[node.next]
      return lo - nodes[node.next]
    else
      nodes[node.next] = lo
      node = node.next
      lo += 1
    end
  end
  return -1
end
#v3
def loop_size(node)
  hit([node], node)
end

def hit(nodes, node)
  unless nodes.include? node.next
    nodes << node.next
    hit(nodes, node.next)  
  else
    nodes.length - nodes.index(node.next)
  end
end

#v3 after research
def loop_size(node)
  ln = sn = find_loop_start(node)
  return -1 if ln.nil?
  length = 1
  while ln.next != sn
    length +=1
    ln = ln.next
  end

  return length

end

def find_loop_start(node)
  slow = fast = node

  while slow.next
    slow = slow.next
    fast = fast.next.next
    if (slow == fast)
      break
    end
  end

  if fast.next.nil?
    return nil
  end
  return fast
end

require 'minitest/spec'
require 'minitest/autorun'


def create_chain_for_test(tail_size, loop_size)
  prev_node = start = Node.new
  start.next = start
  return start if loop_size == 1
  (1..tail_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  end_loop = prev_node
  (1...loop_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  prev_node.next = end_loop
  start
end


describe "loop_size" do
  it "passes" do
    loop_size(create_chain_for_test(3, 10)).must_equal 10
  end
end