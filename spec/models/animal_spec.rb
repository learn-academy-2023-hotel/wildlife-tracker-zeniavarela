require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is valid with valid attributes' do
    bear = Animal.create(name: 'Bear', binomial: 'Ursus Americanus' )
    expect(bear).to be_valid
  end

  it 'is not valid without a name' do
    bear = Animal.create(binomial: 'Ursus Americanus')
    expect(bear.errors[:name]).to_not be_empty
  end

  it 'is not valid without a binomial' do
    bear = Animal.create(name: 'Bear')
    expect(bear.errors[:binomial]).to_not be_empty
  end

  it 'is not valid with duplicate name' do
    bear = Animal.create(name: 'Bear', binomial: 'Ursus Americanus' )
    dupe = Animal.create(name: 'Bear', binomial: 'Ursus American' )
    expect(dupe.errors[:name]).to_not be_valid
  end

  it 'is not valid with duplicate binomial' do
    bear = Animal.create(name: 'Bear', binomial: 'Ursus Americanus' )
    dupe = Animal.create(name: 'Black Bear', binomial: 'Ursus Americanus' )
    expect(dupe.errors[:binomial]).to_not be_valid
  end

  it 'is not valid with same name and binomial' do
    bear = Animal.create(name: 'Bear', binomial: 'Bear' )
    expect(bear).to_not be_valid
  end

end