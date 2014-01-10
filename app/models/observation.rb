class Observation < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :sightings, dependent: :destroy
  has_many :species, through: :sightings
  accepts_nested_attributes_for :sightings, allow_destroy: true
  
  validates :location_id, :user_id, numericality: { only_integer: true }, presence: true
  validates :date, presence: true
  validate :date_cannot_be_in_future
  
  private
  
  def date_cannot_be_in_future
    if date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end
end
