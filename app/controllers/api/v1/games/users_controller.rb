class Api::V1::Games::UsersController < ApplicationController
  def index
    user_games = UserGame.where(game_id: params[:game_id])
    users = User.where(id: user_games.pluck(:user_id))
    render json: GamesUserSerializer.new(users)
  end
end