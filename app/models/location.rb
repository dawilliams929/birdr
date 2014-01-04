class Location < ActiveRecord::Base
  has_many :observations
  has_many :users, through: :observations
end
