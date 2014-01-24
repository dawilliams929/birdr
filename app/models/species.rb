class Species < ActiveRecord::Base
  has_many :sightings
  has_many :observations, through: :sightings
  
  validates :common_name, :scientific_name, :family, presence: true
  validates :common_name, uniqueness: true, length: { maximum: 100 }
  validates :scientific_name, uniqueness: true, length: { maximum: 100 }
  validate :family_ends_in_idae
  
  def genus
    scientific_name.split(" ").first
  end
  
  def to_s
    common_name + " (" + scientific_name + ")"
  end
  
  def is_a_lifer_for?(user)
    user.needs?(self)
  end
  
  private
  
  def family_ends_in_idae
    unless family.end_with?("idae")
      errors.add(:family, "family must end with 'idae'")
    end
  end
end
