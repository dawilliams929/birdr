class SpeciesController < ApplicationController
  def index
    @species = Species.where(
      "common_name LIKE ? OR scientific_name LIKE ?",
      "%#{params[:term]}%",
      "%#{params[:term]}%"
    )
    render json: @species.map(&:to_s)
  end
end
