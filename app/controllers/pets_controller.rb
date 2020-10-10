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
    shelter.pets.create(pets_params)

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
    end

end


# image: params[:pet][:image],
# name: params[:pet][:name],
# description: params[:pet][:description],
# approximate_age: params[:pet][:approximate_age],
# sex: params[:sex],
# adoption_status: 'Adoptable',
# shelter_id: params[:id]
# # })
