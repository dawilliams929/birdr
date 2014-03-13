class Location < ActiveRecord::Base
  has_many :observations
  
  validates :name, :latitude, :longitude, presence: true
  validates :latitude, numericality: {
                                       greater_than: -90,
                                       less_than: 90
                                     }
  validates :longitude, numericality: {
                                        greater_than: -180,
                                        less_than: 180
                                      }
  validates :name, uniqueness: true, length: { maximum: 100, allow_blank: false }
  
  def species
    species = []
    self.observations.each { |observation| species += observation.species }
    species.uniq.sort_by! { |sp| sp.id }
  end
  
  def num_of_species
    self.species.count
  end                                
end
