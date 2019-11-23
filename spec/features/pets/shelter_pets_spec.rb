require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit /shelters/:shelter_id/pets" do
    it "I can see each Pet that can be adopeted from that shelter" do
        shelter = Shelter.create(name: "Best Shelter Broomfield",
                                 address: "124 Main Street",
                                 city: "Broomfield",
                                 state: "CO",
                                 zip: 80020)

        shelter_1 = Shelter.create(name: "Best Shelter Broomfield",
                                address: "124 Main Street",
                                city: "Broomfield",
                                state: "CO",
                                zip: 80020)
        pet_1 = Pet.create(image:"https://placekitten.com/200/300",
                         name: "Fluffy",
                         age: 1,
                         sex: "female",
                         shelter: shelter)

        pet_2 = Pet.create(image:"https://picsum.photos/id/237/200/300",
                         name: "Tootsy",
                         age: 1,
                         sex: "male",
                         shelter: shelter_1)

      visit "/shelters/#{shelter.id}/pets"

      expect(page).to have_content(pet_1.name)
      expect(page).to_not have_content(pet_2.name)
    end
  end
end
