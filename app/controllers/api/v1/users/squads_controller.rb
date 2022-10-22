class Api::V1::Users::SquadsController < ApplicationController
  def index
    user = User.find_by(params[:id])
    squads = UserSquad.where(user_id: user.id)
    render json: squads, status: 201
  end

  def create
    binding.pry
    user_squad = UserSquad.create!(user_id: params[:user_id], squad_id: params[:squad_id], host_id: params[:host_id])
    ContactJob.perform_later(User.find(params[:user_id]),Squad.find(params[:squad_id]),User.find(params[:host_id]))
    render json: user_squad, status: 201
  end

  def destroy
    user_squad = UserSquad.find(params[:id])
    user_squad.destroy
  end
end
