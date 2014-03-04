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
  validates :name,uniqueness: true, length: {
                                      maximum: 100,
                                      allow_blank: false
                                    }
end
