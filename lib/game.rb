require 'pry'

class Game
    attr_accessor :human_player, :enemies
  
    def initialize(name) #initialisation des attribut de la classe 
      @human_player = HumandPlayer.new(name)
      @enemies = []
        4.enemies do |i|  
            @enemies.push(Player.new("player#{i}"))
        end

    end



end

binding.pry