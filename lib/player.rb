class Player

  attr_accessor :name, :life_points

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10 
  end

  def show_state
    "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(number_of_damages)
    
    @life_points = @life_points - number_of_damages
    if @life_points <= 0 
        puts "#{compute_damage} points de dommage lui sont infligés"
        puts "le joueur a été tué !"
    end
  end

  def attacks(player)
    puts "Le joueur #{@name} attaque #{player.name}"
    player.gets_damage(compute_damage)
    
  end 

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level
  
  def initialize(name_to_save)
    super(name_to_save)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme niveau #{weapon_level} "
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon 
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une nouvelle arme niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youpi, elle est mieux que ton arme actuelle, prends-là ! "
    else 
      puts " M@$**, elle n'est pas mieux que ton arme actuelle..."
    end 
  end

  def search_health_pack
    which_health_pack = rand(1..6)
    
    if which_health_pack == 1 
      puts "Tu n'as rien trouvé..."
    elsif  which_health_pack == 6 
      if @life_points >= 20 
         @life_points = 100 
      else @life_points += 80
      end
      puts "Wow, tu as trouvé un pack de +80 points de vie!"

    else
      if @life_points >= 50 
        @life_points = 100 
     else @life_points += 50
     end
      puts "Bravo, tu as trouvé un pack de +50 points de vie ! "
    end
  end

end
