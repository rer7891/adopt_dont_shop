class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def find
    @pet_by_id = Pet.where(shelter_id: params[:shelter_id]).order(created_at: :desc)
  end
end
