require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a pet show page" do
    it "I can click a link to Delete a pet." do
      shelter = Shelter.create(name: "Best Shelter Broomfield",
                                 address: "124 Main Street",
                                 city: "Broomfield",
                                 state: "CO",
                                 zip: 80020)

      pet_1 = Pet.create(image:"https://placekitten.com/200/300",
                         name: "Fluffy",
                         age: 9,
                         sex: "female",
                         shelter: shelter)
      pet_2 = Pet.create(image:"https://picsum.photos/id/237/200/300",
                        name: "Butters",
                        age: 5,
                        sex: "male",
                        shelter: shelter)

      visit "/pets/#{pet_1.id}"

      click_on "Delete This Pet"
      expect(current_path).to eq("/pets")
      expect(page).to have_content(pet_2.name)
      expect(page).to_not have_content(pet_1.name)
    end
  end
end
