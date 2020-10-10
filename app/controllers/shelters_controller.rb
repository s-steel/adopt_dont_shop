class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.new(shelter_params)

    @shelter.save
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)

    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])

    redirect_to '/shelters'
  end

  def shelter_pet
    @shelter = Shelter.find(params[:id])
    @pets = Pet.where(shelter_id: params[:id])
  end

  private
    def shelter_params
      params.permit(:name,
                    :address,
                    :city,
                    :state,
                    :zip
                    )
    end
end
