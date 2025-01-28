require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------
"
puts "Quel est ton prenon ?"
human_player = HumanPlayer.new(gets.chomp)
enemies = [Player.new("Josiane") ,Player.new("José")]

while human_player.life_point > 0 && (enemies[0].life_point >0 || enemies[1].life_point >0)
  puts "tu as #{human_player.life_point} point de vie
Quelle action veux-tu effectuer ?
a - chercher une meilleure arme
s - chercher à se soigner
attaquer un joueur en vue :
"
  print "0 -"
  enemies[0].show_state
  print "1 -"
  enemies[1].show_state
  case gets.chomp
  when "a"
    human_player.search_weapon
  when "s"
    human_player.search_health_pack
  when "0"
    human_player.attacks(enemies[0])
  when "1"
    human_player.attacks(enemies[1])
  end
  if enemies.all? {|player| player.life_point>0}
    puts "Les autres joueurs attaquent !" 
  end
  enemies.each do |player|
    player.attacks(human_player) if player.life_point > 0
  end
end
puts "La partie est fini"
if human_player.life_point > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end


 