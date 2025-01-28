class game
  attr_accessor :human_player, :enemies

  def initialize (name)
    @enemies = []
    4.times do |i|
      @enemies << Player.new("player#{i.to_s}")
    end
    human_player = HumanPlayer.new(name)
  end

  def kill_player (player)
    @enemies.delete(player)
  end

  def si_still_ongoing? 
    @human_player.life_point > 0 && !(enemies.length > 0)
  end

  def




  end
end
