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
    user = User.find_by(id: params[:id])
    if user.present?
      render json: UserSerializer.new(user), status: 201
    else
      render json: { description: "Error: User Not Found" }, status: 404
    end
  end

end
