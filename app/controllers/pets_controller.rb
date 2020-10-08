class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def show
    @pets = Pet.find(params[:id])
  end

  def create
    shelter 

end
