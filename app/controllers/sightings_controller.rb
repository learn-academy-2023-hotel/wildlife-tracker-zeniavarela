class SightingsController < ApplicationController

  # GET sightings for given time period 
  # /sightings
  # utilize query params on postman
  # key: start_date, end_date
  # value: dates yyyy-mm-dd
  # http://localhost:3000/sightings?start_date=2023-12-01&end_date=2023-12-30
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings 
  end

  def show
    sighting = Sighting.find(params[:id])
    render json: sighting
  end

# POST/CREATE a new sighting object 
  def create
    sighting = Sighting.create(sighting_params)
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors, status: 422
    end
  end

  # DELETE/DESTROY an object DELETE /sighting/id
    def destroy 
      sighting = Sighting.find(params[:id])
      if sighting.destroy
        render json: sighting
      else
        render json: sighting.errors, status: 422
      end
    end

    # UPDATE/PATCH an existing object PATCH /sightings/id
    def update 
      sighting = Sighting.find(params[:id])
      sighting.update(sighting_params)
      if sighting.valid?
        render json: sighting
      else
        render json: sighting.errors, status: 422
      end
    end

    # GET sightings for one animal
    # /animals/id/sightings
    def animal_sightings
      animal = Animal.find(params[:id])
      render json: animal.sightings 
    end


    
    private
    
    def sighting_params
      params.require(:sighting).permit(:latitude, :longitude, :date, :animal_id)
    end

end
