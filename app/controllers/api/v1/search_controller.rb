class Api::V1::SearchController < ApplicationController
  def show
    render json: SearchSerializer.new(SearchFacade.gen(params[:city])), status: 200
  end
end 