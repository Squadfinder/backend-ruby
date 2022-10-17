class Api::V1::RawgSearchController < ApplicationController
  def index
    results = RawgSearchFacade.get_name(search_params[:search])
    render json: RawgSearchSerializer.format_games(results)
  end

  private

  def search_params
    params.permit(:search)
  end

end
