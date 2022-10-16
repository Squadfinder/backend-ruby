class Api::V1::GamesController < ApplicationController
  before_action :param_validation

  def show
    game = RawgFacade.get_game(params[:game_id])

    render json: game
  end

  private
  def param_validation
    if !params[:game_id].present?
      render json: { data: {} }, status:400
    end
  end
end