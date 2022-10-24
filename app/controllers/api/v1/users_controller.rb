class Api::V1::UsersController < ApplicationController
  def index
    binding.pry
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end
end
