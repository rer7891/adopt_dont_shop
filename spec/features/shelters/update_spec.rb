require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a shelter show page" do
    it "user clicks on a link to update a shelter" do

      shelter = Shelter.create(name: "Best Shelter Broomfield",
                                 address: "124 Main Street",
                                 city: "Broomfield",
                                 state: "CO",
                                 zip: 80020)

      visit "/shelters/#{shelter.id}"

      click_link 'Update Shelter'




      expect(current_path).to eq("/shelters/#{shelter.id}/edit")

      fill_in 'Name', with: "Puppies are Best"
      fill_in 'Address', with: "12 Main Street"
      fill_in 'City', with: "Denver"
      fill_in 'State', with: "CO"
      fill_in 'Zip', with: 80034
      click_on 'Update Shelter'

      expect(current_path).to eq("/shelters/#{shelter.id}")
      expect(page).to have_content("Puppies are Best")
      expect(page).to have_content("12 Main Street")
      expect(page).to_not have_content("Best Shelter Broomfield")
    end
  end
end
