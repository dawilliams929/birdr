class Species < ActiveRecord::Base
  extend FriendlyId
  friendly_id :common_name, use: :slugged
  
  has_many :sightings
  has_many :observations, through: :sightings
  
  validates :common_name, :scientific_name, :family, presence: true
  validates :common_name, uniqueness: true, length: { maximum: 100 }
  validates :scientific_name, uniqueness: true, length: { maximum: 100 }
  validate :family_ends_in_idae
  
  def normalize_friendly_id(string)
    string.split.join("_")
  end
  
  def genus
    scientific_name.split(" ").first
  end
  
  def to_s
    common_name + " (" + scientific_name + ")"
  end
  
  def to_html
    (common_name + " (<span class='sci-name'>" + scientific_name + "</span>)").html_safe
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
