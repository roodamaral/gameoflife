class Cell
    attr_reader :grid, :x, :y

    def initialize(grid, x, y)
      @grid = grid
      @x = x
      @y = y
    end

    def inspect
      "#{self.class}(#{x}, #{y})"
    end

    def succ
      self.class.const_get("CellWith#{live_neighbor_count}LiveNeighbors").new(self).succ
    end

    def alive?
      raise NotImplementedError
    end

  private

    def neighbors
      neighbor_coordinates.map do |a, b|
        grid.get(a, b)
      end
    end

    def neighbor_coordinates
      @neighbor_coordinates ||= [
        [x - 1, y - 1],
        [x    , y - 1],
        [x + 1, y - 1],

        [x - 1, y    ],
        [x + 1, y    ],

        [x - 1, y + 1],
        [x    , y + 1],
        [x + 1, y + 1],
      ]
    end

    def live_neighbor_count
      neighbors.count(&:alive?)
    end

    class Successor
      attr_reader :cell

      def initialize(cell)
        @cell = cell
      end
    end
  end

  class Grid
    attr_reader :width, :height, :cells

    def initialize(width, height)
      @width = width
      @height = height

      @cells = generate_cells
    end

    def seed(seeds)
      seeds.each do |seed|
        cells[seed['y']][seed['x']] = LiveCell.new(self, seed['x'], seed['y'])
      end
    end

    def get(x, y)
      cells.fetch(y).fetch(x)
    rescue IndexError
      DeadCell.new(self, x, y)
    end

    def run
      loop do
        presenter.present
        step
      end
    end

  private

    def presenter
      @presenter ||= GridPresenter.new(self)
    end

    def step
      new_cells = generate_cells

      cells.each.with_index do |row, y|
        row.each.with_index do |cell, x|
          new_cells[y][x] = cell.succ
        end
      end

      @cells = new_cells
    end

    def generate_cells
      Array.new(height) do |y|
        Array.new(width) do |x|
          DeadCell.new(self, x, y)
        end
      end
    end
  end

  
grid = Grid.new(20,20)

cell = Cell.new(grid,-1,0)
puts cell 
