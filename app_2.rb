require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")

puts player1.name
puts player1.life_points

player_human = HumanPlayer.new("Yuness")

player_human.show_state
#player_human.search_weapon
player_human.search_health_pack
player_human.show_state
binding.pry