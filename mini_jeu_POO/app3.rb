require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "Quel est ton nom ?"
Game.new(gets.chomp)