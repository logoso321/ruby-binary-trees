require './node'

#Builds a binary tree of Node objects given an array of numbers
def build_tree(list)
	if list.size <= 1
		return list
	end

	tree = []

	list.each_with_index do |val, index|
		a = Node.new(val, list[index+1])
		tree << a
	end

	tree.each do |x|
		print("\n#{x}")
	end

	print("\n")
end

build_tree([1,2,3,4,5,6])