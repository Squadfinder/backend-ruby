class Api::V1::Users::GamesController < ApplicationController

  def index
    render json: UserGameSerializer.new(UserGame.list(params[:user_id]))
  end

  def create
    user_game = UserGame.new(user_game_params)
    if user_game.save
      render json: UserGameSerializer.new(user_game), status: 201
    else
      render json: { error: 'Params Are Incorrect' }, status: 401
    end
  end

  def destroy
    if UserGame.exists?(params[:id])
      UserGame.destroy(params[:id])
    else
      render status: 404
    end
  end

  private
  def user_game_params
    params.permit(:user_id, :game_id, :image_url, :game_title)
  end

end
