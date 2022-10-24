class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    if users.present?
      render json: UserSerializer.new(users), status: 201
    else
      render json: { description: "Error: Users Not Found" }, status: 404
    end
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end
end
