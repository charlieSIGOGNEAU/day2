require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_point > 0 && player2.life_point > 0
  puts "Voici l'état de chaque joueur:"
  player1.show_state
  player2.show_state
  puts "passon à la phase d'attaque :"
  player2.attacks(player1)
  player1.attacks(player2) if player1.life_point > 0
  puts "-" *30
end


#binding.pry