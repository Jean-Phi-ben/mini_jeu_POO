require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "voici l'état de chaque joueur :"
player1.show_state 
player2.show_state
puts ""

puts "Passons à l'étape d'attaque"




while #crée une boucle tant que les attributs .life_points sont positifs

    player2.life_points > 0 && player1.life_points > 0 

        player2.attacks(player1)

            if player2.life_points <= 0 
                break
            end

        player1.attacks(player2)


        puts "voici l'état de chaque joueur :"

        player1.show_state
        player2.show_state
        puts "====================="

end

player_human = HumanPlayer.new("Yuness")

player_human.show_state
player_human.search_weapon
player_human.search_health_pack
player_human.show_state

binding.pry