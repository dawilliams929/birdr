class Species < ActiveRecord::Base
  has_many :sightings
  has_many :observations, through: :sightings
  
  def genus
    scientific_name.split(" ").first
  end
end
