class PetsController < ApplicationController

  def index
    @pets = Pet.all.order(status: :asc)
  end

  def find
    @pet_by_id = Pet.where(shelter_id: params[:shelter_id]).order(status: :asc)
    @shelter = Shelter.find(params[:shelter_id])
  end

  def show
    @pet = Pet.find(params[:pet_id])
  end

  def new
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create(pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:pet_id])
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet.update(pet_params)

    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    pet.destroy

    redirect_to "/pets"
  end

  private
  def pet_params
    params.permit(:image, :name, :description, :age, :sex, :status)
  end
end
