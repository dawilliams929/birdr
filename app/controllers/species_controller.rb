class SpeciesController < ApplicationController
  def index
    @species = Species.where(
      "common_name LIKE ? OR scientific_name LIKE ?",
      "%#{params[:term]}%",
      "%#{params[:term]}%"
    ) # change LIKE to ILIKE for postgres for heroku
    render json: @species.map(&:to_s)
  end
  
  def show
    @species = Species.find(params[:id])
    
    @sightings = Sighting.where(species_id: @species.id)
    @observations = @sightings.map { |sighting| sighting.observation }
    @locations = @observations.map { |observation| observation.location }
    @users = @observations.map { |observation| observation.user }
  end
end
