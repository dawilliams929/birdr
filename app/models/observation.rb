class Observation < ActiveRecord::Base
  belongs_to :location
  # belongs_to :user
  has_many :sightings
  has_many :species, through: :sightings
end
