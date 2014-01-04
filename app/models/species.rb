class Species < ActiveRecord::Base
  has_many :sightings
  has_many :observations, through: :sightings
  
  validates :common_name, :scientific_name, :family, presence: true
  validates :common_name, uniqueness: true, length: { minimum: 2, maximum: 100 }
  validates :scientific_name, :uniquenes: true, length: { minimum: 5, maximum: 100 }
  validate :family_ends_in_idae
  
  def genus
    scientific_name.split(" ").first
  end
  
  private
  
  def family_ends_in_idae
    unless family.end_with?("idae")
      errors.add(:family, "family must end with 'idae'")
    end
  end
end
