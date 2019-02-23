class Player
  DEFAULT_HIT_POINTS = 60
  attr_accessor :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def receive_damage
    @hit_points -= 10
  end

  def attack(player)
    player.receive_damage
  end
end
