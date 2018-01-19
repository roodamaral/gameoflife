

require_relative 'gameoflife.rb'

RSpec.describe 'Rules of the game' do
	before(:each) do
		@world = World.new
	end 
	context "Cell Methods" do 
		before(:each) do
		 @cell = Cell.new(@world)
		end
		it 'spawns at the correct places' do 
			cell = @cell.spawn_at(3,5)
			expect(cell.x).to eq(3)
			expect(cell.y).to eq(5)
			expect(cell).to be_an_instance_of(Cell)
			expect(cell.world).to eq(@cell.world)
		end
		it "detects a neighbor to the north of the Cell" do
			cell = @cell.spawn_at(0,1)
			expect(cell.neighbors.count).to eq(1)
		end
		it "detects a neighbor to the north east" do 
			cell = @cell.spawn_at(1,1)
			expect(cell.neighbors.count).to eq(1)
		end
		it "detects a neighbor to the right" do
			cell = @cell.spawn_at(1,0)
			expect(cell.neighbors.count).to eq(1)
		end
		it "detects a neighbor to the left" do
			cell = @cell.spawn_at(-1, 0)
			expect(cell.neighbors.count).to eq(1)
		end
		it "detects a neighbor to the southwest" do
			cell = @cell.spawn_at(-1,-1) 
			expect(cell.neighbors.count).to eq(1)
		end
		it "detects a neighbor to the bottom" do
			cell = @cell.spawn_at(0,-1)
			expect(cell.neighbors.count).to eq(1)
		end
		it "detects a neighbor to the southeast" do 
			cell = @cell.spawn_at(-1,1)
			expect(cell.neighbors.count).to eq(1)
		end
		it "detects a neighbor to the northwest" do 
			cell = @cell.spawn_at(1,-1)
			expect(cell.neighbors.count).to eq(1)
		end
		it "dies" do 
			@cell.die!
			expect(@world.cells).to_not include(@cell)
		end
		it "Rule #1 Any live cell with fewer than 2 live neighbors dies." do
			cell = Cell.new(@world)
			new_cell = cell.spawn_at(2,0)
			@world.tick!
			expect(cell.dead?).to be(true)
		end
		it "Rule #2: Any cell with 2 or three live neighbors lives" do
			cell = Cell.new(@world)
			new_cell = cell.spawn_at(1,0)
			other_new_cell = cell.spawn_at(-1,0)
			@world.tick!
			expect(cell.alive?).to be(true)
		end
		it "Rule #3: Any cell with more than 3 neighbors dies" do
			cell = Cell.new(@world)
			new_cell = cell.spawn_at(1,0)
			other_new_cell = cell.spawn_at(-1,0)
			another_new_cell = cell.spawn_at(-1,-1)
			one_more_cell = cell.spawn_at(1,1)
			@world.tick!
			expect(cell.dead?).to be(true)
		end
		it "Rule #4 Any dead cell with exactly 3 neighbors alive should become a live cell" do
			cell = Cell.new(@world)
			new_cell = cell.spawn_at(0,-1)
			other_new_cell = cell.spawn_at(-1,0)
			another_new_cell = cell.spawn_at(-1,-1)
			cell.die!
			@world.tick!
			expect(@world.cells << cell)
			expect(cell.alive?).to be(true)
			expect(cell.dead?).to be(false)
		end




 


	end
end




# 		it 'has one neighbors that are alive' do 
# 			cell.neighbors = 1
# 			expect(cell.state).to eq(0)
# 		end
# 		it 'has two neighbors that are alive' do 
# 			cell.neighbors = 2
# 			expect(cell.state).to eq(0)
# 		end
# 		it 'has four neighbors that are alive' do 
# 			cell.neighbors = 4
# 			expect(cell.state).to eq(0)
# 		end
# 		it 'has five neighbors that are alive' do 
# 			cell.neighbors = 5
# 			expect(cell.state).to eq(0)
# 		end
# 		it 'has six neighbors that are alive' do 
# 			cell.neighbors = 6
# 			expect(cell.state).to eq(0)
# 		end
# 		it 'has seven neighbors that are alive' do 
# 			cell.neighbors = 7
# 			expect(cell.state).to eq(0)
# 		end
# 		it 'has eight neighbors that are alive' do 
# 			cell.neighbors = 8
# 			expect(cell.state).to eq(0)
# 		end
# 	end

		
		


# # end

# RSpec.describe 'Rules of the game' do
# 	before(:each) do 
# 		@world = World.new
# 	end

# context "utility methods" do
# 	before(:each) do 
# 		@cell = Cell.new
# 		end 
# 		it "spawn relative to" do 
# 			@cell.spawn_at(5,5)
# 			expect(@cell).to be(Cell)
# 			expect(@cell.x).to eq(3)
# 			expect(@cell.y).to eq(5)
# 			expect(@cell.world).to eq(cell.world)
# 		end
# 		it "detects a neighbor to the north" do 
# 			@cell.spawn_at(0,1)
# 			expect(@cell.neighbors).to eq(1)
# 		end

# 		it "detects a neighbor to the north east" do 
# 			@cell.spawn_at(1,1)
# 			expect(cell.neighbors).to eq(1)
# 		end

# 		it "dies" do
# 			@cell.die!
# 			expect(cell.world.cells).to_not include (@cell)
# 		end

# 		it "detects a neighbor to the left" do
# 			@cell.spawn_at(-1,0)
# 			cell.neighbors.should == 1
# 		end

# 		it "detects a neighbor to the right" do 
# 			@cell.spawn(1,0)
# 			cell.neighbors.should == 1
# 		end



#  		it 'Any live cell with fewer than 2 neighbors dies' do 
# 			cell = Cell.new(world)
# 			@cell.spawn_at(2,0)
# 			world.tick!

# 			expect(cell.dead).to eq(true)
# 		end

# 		it "Any live with two or three neighbors lives on"
# 			cell = Cell.new(world)
# 			new+_cell = cell.spawn_at(-1,0)
# 			world.tick!
# 			cell.should_be alive 
# 		end
# 	end
# end
