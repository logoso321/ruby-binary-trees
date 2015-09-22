class Node
	attr_accessor :value, :child_a, :child_b

	def initialize(num, lower = nil, higher = nil)
		@value = num
		#If the user enters false input
		if(lower != nil && higher != nil && lower > higher)
			@child_a = higher
			@child_b = lower
		else
			@child_a = lower
			@child_b = higher
		end
	end

	def value
		return @value
	end

	def to_s
		if(@child_a == nil && @child_b == nil)
			return "Node #{@value} has no children"
		elsif(@child_a == nil)
			return "Node #{@value} has child #{@child_b}"
		elsif(@child_b == nil)
			return "Node #{@value} has child #{@child_a}"
		else
			return "Node #{@value} has children (#{@child_a}, #{@child_b})"
		end
	end
end