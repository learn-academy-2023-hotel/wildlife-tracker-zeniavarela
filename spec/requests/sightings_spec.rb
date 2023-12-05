require 'rails_helper'

  RSpec.describe 'Sightings API', type: :request do
    describe 'POST /sightings' do
      it 'returns a 422 status code with validation errors' do
        post '/sightings', params: { sighting: { latitude: 45.5231, longitude: -122.6765 } }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to have_key('errors')
      end
    end
  end