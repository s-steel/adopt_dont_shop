class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
  end

  def show
    @pets = Pet.find(params[:id])
  end

end
