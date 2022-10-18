class Api::V1::UsergamesController < ApplicationController

  def index
    render json: UserGameSerializer.new(UserGame.list(params[:user_id]))
  end

  def create
    user = User.find_by_id(params[:user_id])
    user_game = UserGame.new(user_params)
    if user_game.save
      render json: UserGameSerializer.new(user_game), status: 201
    else
      render json: { error: 'Email Or Password Is Incorrect' }, status: 401
    end
  end


  private
    def user_params
      params.permit(:user_id, :game_id, :image_url, :game_title)
    end
end
