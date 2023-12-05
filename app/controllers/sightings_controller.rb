class SightingsController < ApplicationController

  def index
    sightings = Sighting.all

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
      render json: sighting.errors
    end
  end

  # DELETE/DESTROY an object DELETE /sighting/id
    def destroy 
      sighting = Sighting.find(params[:id])
      if sighting.destroy
        render json: sighting
      else
        render json: sighting.errors
      end
    end

    # UPDATE/PATCH an existing object PATCH /sightings/id
    def update 
      sighting = Sighting.find(params[:id])
      sighting.update(sighting_params)
      if sighting.valid?
        render json: sighting
      else
        render json: sighting.errors 
      end
    end


    
    private
    
    def sighting_params
      params.require(:sighting).permit(:latitude, :longitude, :date, :animal_id)
    end

end
