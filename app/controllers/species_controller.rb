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
        
    sightings = @species.sightings
    observations = sightings.map(&:observation)
    locations = observations.map(&:location).uniq
    
    locations.map! do |location|
      {
        name: location.name,
        lat: location.latitude,
        long: location.longitude,
        id: location.id
      }
    end
    
    locations.each do |location|
      obs = []
      
      observations.each do |observation|
        if observation.location.id == location[:id]
          ob = {
            user: observation.user.email,
            count: 0,
            date: observation.date.to_date.to_s,
            observation_id: observation.id
          }
          obs << ob
        end
      end
      
      location[:data] = obs.sort_by { |ob| ob[:date] }.reverse
    end
    
    respond_to do |format|
      format.html
      format.json { render json: locations }
    end
  end
end
