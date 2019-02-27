class Game
attr_reader :players

  def initialize(player1, player2)
    @players = [player1, player2]
  end

 def player_1
   @players.first
 end

 def player_2
   @players.last
 end

  def attack(player)
    player.receive_damage
  end
end
