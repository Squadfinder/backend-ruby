class Api::V1::Users::SquadsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    if !user.nil?
      squads = UserSquad.where(user_id: user.id)
      render json: UserSquadSerializer.new(squads), status: 201
    else
      render json: { description: "Error: User not found" }, status: 404
    end
  end

  # def create
  #   user_squad = UserSquad.create!(user_id: params[:user_id], squad_id: params[:squad_id], host_id: params[:host_id])
  #   ContactJob.perform_later(User.find(params[:user_id]),Squad.find(params[:squad_id]),User.find(params[:host_id]))
  #   render json: user_squad, status: 201
  # end

  def destroy
    user_squad = UserSquad.find_by(id: params[:id])
    if !user_squad.nil?
      user_squad.destroy
      render json: { description: "UserSquad deleted successfully" }, status: 204 
    else
      render json: { description: "Error: UserSquad not found" }, status: 404
    end
  end
end
