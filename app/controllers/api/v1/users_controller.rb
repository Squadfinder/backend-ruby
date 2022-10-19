class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    # render json: UserShowSerializer.format_user(User.find(params[:id]), UserGame.list(params[:id]))
    render json: UserSerializer.new(User.find(params[:id]))
  end
end
