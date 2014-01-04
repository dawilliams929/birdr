class Sighting < ActiveRecord::Base
  belongs_to :species
  belongs_to :observation
  
  validates :observation_id, :species_id, :count,
  presence: true, numericality: { only_integer: true }
  validates :count, numericality: { greater_than: 0 }
end
