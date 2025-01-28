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
puts "Quel est ton nom ?"
my_game = Game.new(gets.chomp)

while my_game.si_still_ongoing? 
  my_game.menu
  my_game.menu_choice(gets.chomp)
  my_game.enemies_attack 
end
my_game.game_over

