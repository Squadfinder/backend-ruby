class Api::V1::UsergamesController < ApplicationController

  def index
    render json: UserGameSerializer.new(UserGame.list(params[:user_id]))
  end



end
