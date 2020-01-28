require 'pry'

class Player
    attr_accessor :name, :life_points
  
    def initialize(name) #initialisation des attribut de la classe 
      @name = name
      @life_points = 10
    end


    def show_state # définit la méthode qui affiche le joueur
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage) #méthode qui décompte les points de vie appelé dans app.rb
    
        @life_points = @life_points - damage

            if @life_points <= 0
                puts "Le Joueur #{@name} a été tué"
                puts ""
                return @life_points = 0
            
            end
    end

    def attacks(player) #méthode qui fait appel à un objet de la même calsse / il ne faut pas mettre de majuscule
    
        puts "le joueur #{@name} attaque #{player.name}"
        lose_random = compute_damage
        
        puts "#{@name} inflige #{lose_random} points à #{player.name}"
        puts ""
        
        player.gets_damage(lose_random)
    
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        
        super(name)
        @life_points = 100
        @weapon_level = 1
        
        
    end
        
    def show_state # définit la méthode qui affiche le joueur et le weapon level
            puts "#{@name} a #{@life_points} points de vie et une arme de nivau #{@weapon_level}"
    end
    

    def compute_damage
            rand(1..6) * @weapon_level
    end


    def search_weapon 
        n = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{n}" 

            if @weapon_level < n 
                @weapon_level = n
                puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            else "M@.! Elle n'est pas que ton arme actuelle..."
            end
    end

    def search_health_pack 
        
        n = rand(1..6)

        if n == 1
            puts "Tu n'as rien trouvé"
            elsif n>=2 && n <=5 
            @life_points = [@life_points+50, 100].min

            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            else n==6
            @life_points = [@life_points + 80, 100].min
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        end


    end


end





