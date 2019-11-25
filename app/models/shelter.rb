class Shelter < ApplicationRecord
   validates_presence_of :name, :address, :city, :state, :zip

   has_many :pets

  def counts(shelter_id)
    shelter = Shelter.find(shelter_id)
    shelter.pets.count
  end
end
