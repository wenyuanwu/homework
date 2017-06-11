class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @player = player
    @board = board
  end

  def attack(pos)
    x = pos.first
    y = pos.last
    grid = @board.grid
    grid[x][y] = :x
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    inputs = player.get_play
    attack(inputs)
  end

end
