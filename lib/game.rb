class Game
attr_reader :current_turn

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

 def player_1
   @players.first
 end

 def player_2
   @players.last
 end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(player)
    switch_player(player).first
  end

  def game_over?
    losing_players.any?
  end

  def loser
    losing_players.first
  end

  private
  attr_reader :players

  def losing_players
    players.select { |player| player.hit_points <= 0}
  end

  def switch_player(the_player)
    players.select { |player| player != the_player }
  end

end
