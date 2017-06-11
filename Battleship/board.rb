# 25 mins

class Board

attr_accessor :grid

  def self.default_grid
    Array.new(10) {Array.new(10)}
  end

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def count
    count = 0
    grid.each do |row|
      row.each do |node|
        count += 1 if node == :s
      end
    end
    count
  end

  def empty?(*pos)
    if pos[0] == nil
      @grid.each do |row|
        row.each do |node|
          if node == :s
            return false
          end
        end
      end
      return true
    else
      x = pos[0].first
      y = pos[0].last
      @grid[x][y] == nil ? true : false
    end
  end

  def full?
    @grid.each do |row|
      row.each do |node|
        if node == nil
          return false
        end
      end
    end
    return true
  end

  def place_random_ship
    if full?
      raise StandardError.new
    else
        x = rand(@grid.size)
        y = rand(@grid[0].size)
        if  @grid[x][y] == nil
            @grid[x][y] = :s
        end
    end
  end

  def won?
    empty? ? true : false
  end

end
