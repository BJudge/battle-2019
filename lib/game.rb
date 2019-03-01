class Game
attr_reader :players, :current_turn

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
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

  def switch_turns
    @current_turn = switch_player(current_turn)
  end

  def switch_player(the_player)
    @players.select { |player| player != the_player }.first
  end

end
