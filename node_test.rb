#Builds a binary tree of Node objects given an array of numbers
class Node
  attr_reader :value
  attr_accessor :parent, :left_child, :right_child
  
  def initialize(value, parent=nil, left_child=nil, right_child=nil)
    @value = value
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end

  def add_branch(val)
    if val <= self.value && self.left_child.nil?
      self.left_child = Node.new(val, self)
    elsif val <= self.value && self.left_child != nil
      self.left_child.add_branch(val)
    elsif val > self.value && self.right_child.nil?
      self.right_child = Node.new(val, self)
    elsif val > self.value && self.right_child != nil
      self.right_child.add_branch(val)
    end
  end

  def breadth_first_search(val)
    queue = [] << self
    
    while !queue.empty?
      n = queue.shift
      val_to_check = n.value

      if val_to_check == val
        puts "Value #{val} found in node: #{n.value}"
        return n
      else
        queue << n.left_child if !n.left_child.nil?
        queue << n.right_child if !n.right_child.nil?
      end
    end

    puts "Value #{val} not found in this tree." if queue.empty?

  end

  def depth_first_search(val)
  stack = [] << self
  result = []
  
    while !stack.empty?
      n = stack.last
      val_to_check = n.value
      
      if val_to_check == val
        puts "Value #{val} found in node: #{n}"
        return n
      else
        if !n.left_child.nil? && !result.include?(n.left_child)
          stack << n.left_child
        elsif !n.right_child.nil? && !result.include?(n.right_child)
          stack << n.right_child
        else
          poppy = stack.pop
          result << poppy
          if stack.last==self
            puts "Value #{val} not found in this tree."
            break
          end
        end
      end
    end
  end

  def dfs_rec(val)
    x = nil
    if self.value == val
      puts "Value #{val} found in node: #{self.value}"
      return self
    else
      if x.nil?
        x = self.left_child.dfs_rec(val) if !self.left_child.nil?
        return x if !x.nil?
        x = self.right_child.dfs_rec(val) if !self.right_child.nil?
        return x if !x.nil?
      end
    end
    puts "Value #{val} not found in this tree." if self.parent.nil? && x.nil?
  end

end

def build_tree(list)
  tree = Node.new(list[0])
  list.each_with_index do |value, index|
    if index>0
      tree.add_branch(value)
    end
  end
  tree
end

a = [1, 5, 9, 12, 0, 6, 2, 270, 35, 89]
tree = build_tree(a)

puts "\nBreadth first search result: "
a = tree.breadth_first_search(270)

puts "\nDepth first search result: "
a = tree.depth_first_search(89)

puts "\nRecursive depth first search result: "
a = tree.dfs_rec(2)
