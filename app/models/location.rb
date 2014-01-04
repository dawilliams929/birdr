class Location < ActiveRecord::Base
  has_many :observations
  has_many :users, through: :observations
  
  validates :name, :latitude, :longitude, presence: true
  validates :latitude, numericality: { greater_than: -90, less_than: 90 }
  validates :longitude, numericality: { greater_than: -180, less_than: 180 }
  validates :name, length: { maximum: 100, allow_blank: false }, uniqueness: true
end
