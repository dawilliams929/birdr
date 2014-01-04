class SightingsController < ApplicationController
  def new
    @sighting = Sighting.new
    @species = Species.all
  end
  
  def create
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      redirect_to sightings_url
    else
      render :new
    end
  end
  
  def index
    @sightings = Sighting.all
  end
  
  def show
    @sighting = Sighting.find(params[:id])
  end
  
  private
  
  def sighting_params
    params.require(:sighting).permit(:observation_id, :species_id, :count)
  end
end
