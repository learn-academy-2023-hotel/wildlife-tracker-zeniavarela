class Animal < ApplicationRecord
  has_many :sightings
  accepts_nested_attributes_for :sightings 
  validates :name, :binomial, presence: true
  validates :name, uniqueness: true
  validates :binomial, uniqueness: true
end
