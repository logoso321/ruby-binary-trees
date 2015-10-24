class Node
	attr_accessor :data, :left, :right, :parent

	def initialize(data, left = nil, right = nil)
		@data = data
		@left = left
		@right = right
	end

	def data
		if (@data)
			return @data
		else
			return "none"
		end
	end
	
	def to_s
		print("#{data}")
		if(left && right)
			print(" has children (#{@left.data}, #{@right.data})")
		elsif(left)
			print(" has left node #{@left.data}")
		elsif(right)
			print(" has right node #{@right.data}")
		else
			print(" has no children")
		end
	end

	def <=>(node)
		return @data <=> node.data
	end
end

