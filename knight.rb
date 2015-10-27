class Knight
	attr_accessor :board, :position, :parent, :num_moves

	def initialize(position = [0,0], parent = nil)
		@position = position
		@board = []
		@parent = parent
		#creates the game board with 8x8 dimensions
		8.times do |y|
			8.times do |x|
				@board << [x,y]
			end
		end
	end

	def knight_moves(start, finish)
		if(start == finish)
			return "You have reached your destination in 0 moves!"
		end

		@num_moves = 0
		move_list = []
		root = Knight.new(start)
		#possible moves for the knight from its starting position
		possible = possible_moves(start)

		#BFS algorithm for reaching finish from start
		queue = []

		possible.each do |loc|
			knight = Knight.new(loc, root)
			queue << knight
		end

	    while !queue.empty?
	      current = queue.shift #Current worked on Knight
	      position = current.position #Position of current knight on the gameboard
	      if position == finish
	      	#Returns the ancestors (parents) of the end nod
	      	temp = current
	      	until temp == false
	      		move_list << ancestors(root, temp)
	      		temp = ancestors(root, temp)
	      	end

	      	move_list.select! {|x| x.is_a? Knight}
	      	move_list.reverse!
	      	move_list.shift #Removes the starting position (start)
	      	@num_moves = (move_list.length + 1)
	      	move_list << current


	   		print("You made it in #{(@num_moves)} moves!  Here's your path: \n#{start}")
	   		move_list.each do |x|
	   			print("\n#{x.position}")
	   		end
	   		print("\n")
		    break
	      else
	        possible = possible_moves(position)
	        possible.each do |x|
	        	knight = Knight.new(x, current)
	        	queue << knight
	        end
	      end
	    end

	    if(queue.empty?)
	    	print "Not found"
	    end
	end

	def ancestors(root, node)
		if(root == nil || node == nil)
			return false
		else
			return node.parent
		end
	end

	def possible_moves(location)
		x = location[0]
		y = location[1]
		moves = [[x + 1, y + 2], [x - 1, y + 2], [x + 1, y - 2], [x - 1, y - 2],
				 [x + 2, y + 1], [x - 2, y + 1], [x - 2, y - 1], [x + 2, y - 1]]
		moves.select! {|pos| pos[0] >= 0 && pos[0] <= 7 && pos[1] >= 0 && pos[1] <= 7}
		return moves
	end

end

knight = Knight.new([4,5])
finish = [0,0]

print(knight.knight_moves(knight.position,finish))