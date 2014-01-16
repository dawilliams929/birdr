class ObservationsController < ApplicationController
  before_filter :check_logged_in_user
  
  def new
    @observation = Observation.new
  end
  
  def create
    @observation = Observation.new(observation_params)
    @observation.user_id = current_user.id
    
    if @observation.save
      redirect_to @observation
    else
      render :new
    end
  end
  
  def index
    @observations = Observation.all
  end
  
  def show
    @observation = Observation.find(params[:id])
  end
  
  private
  
  def check_logged_in_user
    if !signed_in?
      redirect_to new_session_path
    end
  end
  
  def observation_params
    params.require(:observation).permit(
      :location_id,
      :user_id,
      :date,
      sightings_attributes: [:id, :species_id, :species_name, :count, :_destroy]
    )
  end
end
