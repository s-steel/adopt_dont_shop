class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    new_pet = shelter.pets.create(pets_params)
    new_pet.save
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pets_params)

    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])

    redirect_to '/pets'
  end

  private
    def pets_params
      params.permit(
                    :image,
                    :name,
                    :description,
                    :approximate_age,
                    :sex,
                    :adoption_status
                    )
        .with_defaults(adoption_status: 'Adoptable')
      end

end
