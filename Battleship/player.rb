class HumanPlayer
  attr_reader :player

  def initialize (player)
    @player = player
  end

  def get_play
    get.chomp.split(",")
  end

end
