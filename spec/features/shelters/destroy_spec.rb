require 'rails_helper'

RSpec.describe "as a vistior", type: :feature do
  describe "when I visit a shelter show page" do
    it "I can click on a link to delete a shelter even if it has pets and redirect back to shelter index " do

      shelter_1 = Shelter.create(name: "Best Shelter Cincinatti",
                                 address: "323 Boulder St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: 83420)

      shelter_2 = Shelter.create(name: "Best Shelter Broomfield",
                                 address: "124 Main Street",
                                 city: "Broomfield",
                                 state: "CO",
                                 zip: 80020)
      pet = Pet.create(image:"https://placekitten.com/200/300",
                          name: "Fluffy",
                          age: 9,
                          sex: "female",
                          shelter: shelter_1)


      visit "/shelters/#{shelter_1.id}"

      click_link 'Delete Shelter'

      expect(current_path).to eq("/shelters")
      expect(page).to have_content(shelter_2.name)
      expect(page).to_not have_content(shelter_1.name)

      visit "/shelters/#{shelter_2.id}"

      click_link 'Delete Shelter'

      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content(shelter_2.name)
    end
  end
end
