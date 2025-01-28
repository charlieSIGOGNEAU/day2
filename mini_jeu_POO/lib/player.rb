class Player
  attr_accessor :name, :life_point
  
  def initialize (name)
    @name = name
    @life_point = 10
  end

  def show_state
    puts "#{self.name} a #{self.life_point} point de vie"
  end

  def gets_damage(domage)
    @life_point -= domage
    puts "le joueur #{self.name} est mort" if life_point <= 0
  end

  def attacks(player)
    puts "le joueur #{self.name} attaque le joueur #{player.name}"
    damage = compute_damage
    player.gets_damage(damage)
    puts "#{self.name} a infligé #{damage} à #{player.name}"
  end

  def compute_damage
    rand (1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name)
    super(name)
    @life_point = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{self.name} a #{self.life_point} points de vie et une arme de niveau #{self.weapon_level}"
  end

  def compute_damage
    rand(1..6) * self.weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > self.weapon_level
      self.weapon_level = new_weapon
      puts "youhou ! elle est meilleur que mon arme actuelle : tu la prend"
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
  integer = rand(1..6)
    case integer
    when 1
      puts "tu n'as rientrouvé..."
    when 2..5
      puts "Bravo, tu as trouvé un paque de 50 points de vie"
      self.life_point += 50
      self.life_point = [self.life_point, 100].min
    when 6
      puts "waow,l tu a trouvé un pack de +80 points de vie"
      self.life_point +=80
      self.life_point = [self.life_point, 100].min
    end
  end

end