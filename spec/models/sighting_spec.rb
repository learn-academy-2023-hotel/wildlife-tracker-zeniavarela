require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is valid with valid attributes' do
    bear = Animal.create(name: 'Bear', binomial: 'Ursus Americanus' )
    bear.sightings.create(latitude:'1234', longitude:'1234', date:'2023-12-05')
    expect(bear).to be_valid
  end

  it 'is not valid without a latitude' do
    bear = Animal.create(name: 'Bear', binomial: 'Ursus Americanus' )
    bear.sightings.create(longitude:'1234', date:'2023-12-05')
    expect(bear.errors[:latitude]).to_not be_empty
  end

  it 'is not valid without a longitude' do
    bear = Animal.create(name: 'Bear', binomial: 'Ursus Americanus' )
    bear.sightings.create(latitude:'1234', date:'2023-12-05')
    expect(bear.errors[:longitude]).to_not be_empty
  end

  it 'is not valid without a date' do
    bear = Animal.create(name: 'Bear', binomial: 'Ursus Americanus' )
    bear.sightings.create(latitude:'1234', longitude:'1234')
    expect(bear.errors[:date]).to_not be_empty
  end

  it 'is not valid if date is less than 10 characters' do
    short_date = Animal.create(name: 'Bear', binomial: 'Ursus Americanus' )
    bear.sightings.create(latitude:'1234', longitude:'1234', date:'20231205')
    expect(short_date.errors[:date]).to_not be_empty
  end

end
