
class Cell 
	attr_accessor :world, :x, :y
	
	def initialize(world, x=0, y=0)
		@world = world
		@x = x
		@y = y
		world.cells << self
	end 

	def die! 
		world.cells -= [self]
	end

	def dead?
		!world.cells.include?(self)
	end

	def live!
		world.cells << self
	end


	def alive?
		world.cells.include?(self)
	end



	def neighbors

		@neighbors = []
		world.cells.each { |cell|
			#has a cell to the north 
			if self.x == cell.x && self.y == cell.y+1
				@neighbors << cell
			end
			#has a cell to the northeast
			if self.x == cell.x+1 && self.y == cell.y+1
				@neighbors << cell
			end
			#has a cell to the right
			if self.x == cell.x+1 && self.y == cell.y
				@neighbors << cell
			end 
			if self.x == cell.x-1 && self.y == cell.y
				@neighbors << cell
			end
			if self.x == cell.x-1 && self.y == cell.y-1
				@neighbors << cell
			end
			if self.x == cell.x && self.y == cell.y-1
				@neighbors << cell
			end
			if self.x == cell.x-1 && self.y == cell.y+1
				@neighbors << cell
			end
			if self.x == cell.x+1 && self.y == cell.y-1
				@neighbors << cell
			end			
		}

		@neighbors
	end

	def spawn_at(x,y)
		Cell.new(world,x, y)
	end


end



class World 
	attr_accessor :cells

	def initialize
		@cells = []
	end 

	def tick! 
		cells.each { |cell|
			if cell.neighbors.count < 2
				cell.die!
			end
			if cell.neighbors.count > 3
				cell.die!
			end
			if cell.dead? && cell.neighbors.count === 3
				cell.live!
			end


		}

	end

end