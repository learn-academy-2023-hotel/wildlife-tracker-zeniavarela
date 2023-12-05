class AnimalsController < ApplicationController

  # GET/READ request /animals to see all animals in db
  def index
    animals = Animal.all
    render json: animals
  end

  # GET/READ one animal from the db /animals/id
  def show
    animal = Animal.find(params[:id])
    render json: animal
  end

# POST/CREATE a new animal object POST /animals
  def create
    animal = Animal.create(animal_params)
    if animal.valid?
      render json: animal
    else
      render json: animal.errors
    end
  end

  # DELETE/DESTROY an object DELETE /animal/id
    def destroy 
      animal = Animal.find(params[:id])
      if animal.destroy
        render json: animal
      else
        render json: animal.errors
      end
    end

    # UPDATE/PATCH an existing object PATCH /animals/id
    def update 
      animal = Animal.find(params[:id])
      animal.update(animal_params)
      if animal.valid?
        render json: animal
      else
        render json: animal.errors 
      end
    end

    def sightings 
      animal = Animal.find(params[:id])
      render json: { animal: animal, sightings: animal_sightings }
    end

    
    private
    
    def animal_params
      params.require(:animal).permit(:name, :binomial)
    end
end
