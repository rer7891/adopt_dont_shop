require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a pet show page" do
    it "I can click a link and update that pet" do
      shelter = Shelter.create(name: "Best Shelter Broomfield",
                                 address: "124 Main Street",
                                 city: "Broomfield",
                                 state: "CO",
                                 zip: 80020)

      pet = Pet.create(image:"https://placekitten.com/200/300",
                         name: "Fluffy",
                         description: "Fluffy is a cutie.",
                         age: 9,
                         sex: "female",
                         shelter: shelter)

      visit "/pets/#{pet.id}"

      click_link "Update Pet Info"

      expect(current_path).to eq("/pets/#{pet.id}/edit")
      fill_in 'Name', with: "Felix"
      fill_in 'Description', with: "Felix is wonderful."
      fill_in 'Age', with: 6
    
      click_on 'Update Pet Details'

      expect(current_path).to eq("/pets/#{pet.id}")
      expect(page).to have_content("Felix")
    end
  end
end
