class SpeciesController < ApplicationController
  def index
    @species = Species.where(
      "common_name ILIKE ? OR scientific_name ILIKE ?",
      "%#{params[:term]}%",
      "%#{params[:term]}%"
    )
    render json: @species.map(&:to_s)
  end
end
