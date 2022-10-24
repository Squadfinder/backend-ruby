class Api::V1::UsersController < ApplicationController
  before_action :param_validation
  def index
    users = User.all
    if users.present?
      render json: UserSerializer.new(users), status: 201
    else
      render json: { description: "Error: Users Not Found" }, status: 404
    end
  end

  def show
    user = User.find(params[:id])
      render json: UserSerializer.new(user), status: 201
  end

  private

  def param_validation
    if params[:id].present?
      render json: { description: "Error: User Not Found" }, status: 404
    end
  end
end
