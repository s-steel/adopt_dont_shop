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
