require 'sinatra'
require_relative './lib/player.rb'
require_relative './lib/game.rb'
require_relative './lib/attack.rb'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end


  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @current_turn = @game.current_turn.name
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    @player_1_hit_points = @game.player_1.hit_points
    @player_2_hit_points = @game.player_2.hit_points
    erb :play
  end

  post '/switch-turns' do
    @game.switch_turns
    redirect('/play')
  end

  post '/attack' do
    Attack.run(@game.opponent_of(@game.current_turn))
    if @game.game_over?
      redirect '/game-over'
    else
      redirect 'attack'
    end
  end

  get '/attack' do
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    erb :attack
  end

  get '/game-over' do
    erb :game_over
  end

run! if app_file == $0
end
