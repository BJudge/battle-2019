require 'sinatra'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    @current_turn = @game.current_turn.name
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    @player_1_hit_points = @game.player_1.hit_points
    @player_2_hit_points = @game.player_2.hit_points
    erb :play
  end

  get '/attack' do
    @game = $game
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    @player_1_attack = @game.attack(@game.player_2)
    @game.switch_turns
    erb :attack
  end

run! if app_file == $0
end
