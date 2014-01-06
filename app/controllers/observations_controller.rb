class ObservationsController < ApplicationController
  def new
    @observation = Observation.new
  end
  
  def create
    @observation = Observation.new(observation_params)
    if @obser vation.save
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
  
  def observation_params
    params.require(:observation).permit(:location_id, :user_id, :date)
  end
end
