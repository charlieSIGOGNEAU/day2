class Game
  attr_accessor :human_player, :enemies

  def initialize (name)
    @enemies = []
    4.times do |i|
      @enemies << Player.new("player#{i.to_s}")
    end
    @human_player = HumanPlayer.new(name)
  end

  def kill_player (player)
    @enemies.delete(player)
  end

  def si_still_ongoing? 
    @human_player.life_point > 0 && @enemies.length > 0
  end

  def show_payer
    human_player.show_state
    puts "Il reste #{@enemies.length} enemies"
  end

  def menu
    puts "tu as #{@human_player.life_point} point de vie
Quelle action veux-tu effectuer ?
a - chercher une meilleure arme
s - chercher à se soigner
attaquer un joueur en vue :
"
    @enemies.each_with_index do |enemy, i|
      print "#{i} - "
      enemy.show_state
    end
  end

  def menu_choice (choice)
    human_player.search_weapon if choice == "a"
    human_player.search_health_pack if choice == "s"
    if choice.to_i >= 0 && choice.to_i <= @enemies.length && choice.to_i.to_s == choice
      @human_player.attacks(@enemies[choice.to_i])
      kill_player(@enemies[choice.to_i]) if @enemies[choice.to_i].life_point <= 0
    end
  end

  def enemies_attack 
    @enemies.each do |enemies|
      enemies.attacks(@human_player)
    end
  end

  def game_over
    if human_player.life_point > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end
end
