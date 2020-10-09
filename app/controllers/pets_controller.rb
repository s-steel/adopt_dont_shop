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
    pet = shelter.pets.create({
      image: params[:pet][:image],
      name: params[:pet][:name],
      description: params[:pet][:description],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      adoption_status: 'Adoptable',
      shelter_id: params[:id]
    })
    binding.pry
    pet.save

    redirect_to "/shelters/#{shelter.id}/pets"
  end

end
