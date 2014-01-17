class SpeciesController < ApplicationController
  def index
    @species = Species.where("common_name LIKE ?", "%#{params[:term]}%")
    render json: @species.map(&:to_s)
  end
end
