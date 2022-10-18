class Api::V1::Users::GamesController < ApplicationController

  def index
    render json: UserGameSerializer.new(UserGame.list(params[:user_id]))
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
