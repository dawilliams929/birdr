class User < ActiveRecord::Base
  has_many :observations
  has_many :sightings, through: :observations
  
  def life_list
    species = []
    self.sightings.each { |sighting| species << sighting.species }
    
    species.uniq.sort_by! { |sp| sp.id }
  end
  
  def has_seen?(species)
    self.life_list.include?(species)
  end
  
  def needs?(species)
    !has_seen?(species)
  end
end
