class Api::V1::GamesController < ApplicationController
  before_action :param_validation

  def show
    game = RawgFacade.get_game(params[:id])
    render json: game, status: 200
  end

  private
  def param_validation
    if !params[:id].present?
      render json: { data: {} }, status:400
    end
  end
end 
