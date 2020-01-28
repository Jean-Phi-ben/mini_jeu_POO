require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Affichage d'accueil
puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

#Demander et enregister le nom du joueur humain
puts "Entrer votre nom"
print ">"
name = gets.chomp

#Definir les objet de Class Player et de Class HumanPlayer
human_player = HumanPlayer.new(name.to_s)
player1 = Player.new("Josiane")
player2 = Player.new("José")


#Mettre les 2 ennemies dans un tableau
enemies = [player1, player2]

while #condition de sortie quand au moins une Class Player a un attribut @life_points positif
    human_player.life_points > 0 && (player1.life_points > 0 && player2.life_points > 0)

    human_player.show_state
    puts ""
    puts "Qelle action veux-tu effectuer ?"
    puts "    a - chercher une meilleure arme"
    puts "    s - chercher à se soigner"
    puts "Attaquer un joueur en vue :"
    print "    0 - "
    player1.show_state
    print "    1 - "
    player2.show_state

    puts "Entrer votre choix :"
    print ">"

    enter = gets.chomp

    #Structure conditionnelle avec case pour gérer 4 cas
    case enter
    when "a" 
            human_player.search_weapon
    when "s" 
            human_player.search_health_pack
    when "0" #A mettre en "" ou à convertir en entier au choix  
            human_player.attacks(player1)
    else "1"  
            human_player.attacks(player2)
    end

    puts "Les autres joueurs t'attaquent !"

    #Replique des ennemies
    enemies.each do |enemy|
        if enemy.life_points > 0
          enemy.attacks(human_player)
        end
      end

end

puts "LA PARTIE EST FINIE"

if human_player.life_points > 0
    puts "tu as gagné"
  else
    puts "tu as perdu"
end

binding.pry 
