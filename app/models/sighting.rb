class Sighting < ActiveRecord::Base
  belongs_to :species
  belongs_to :observation
  
  validates :species_id,
            :count,
            presence: true,
            numericality: { only_integer: true } # needed to stop validating :observation_id for some reason
  validates :count, numericality: { greater_than: 0 }
  
  def species_name
    species.try(:common_name)
  end
  
  def species_name=(name)
    common_name = name.match(/^.*?(?=\s\()/)[0]
    self.species = Species.find_by_common_name(common_name)
  end
    
end
