class Location < ApplicationRecord
  has_many :addressables

  validates_presence_of :latitude, :longitude
end
