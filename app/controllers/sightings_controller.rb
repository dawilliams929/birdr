class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
  end
  
  def show
    @sighting = Sighting.find(params[:id])
  end
end
