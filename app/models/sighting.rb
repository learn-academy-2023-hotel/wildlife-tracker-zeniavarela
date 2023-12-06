class Sighting < ApplicationRecord
  belongs_to :animal
  validates :latitude, :longitude, :date, :animal_id, presence: true
  validates :date, length: { minimum: 10 } 
end
