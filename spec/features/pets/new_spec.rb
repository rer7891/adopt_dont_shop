require 'rails_helper.rb'

RSpec.describe "As a visitor", type: :feature do
  describe "I can visit pets shelter index page" do
    describe "and see a link to add an adoptable pet" do
      it "can click a link and fill in a form for a new pet" do
        shelter = Shelter.create(name: "Best Shelter Broomfield",
                                 address: "124 Main Street",
                                 city: "Broomfield",
                                 state: "CO",
                                 zip: 80020)
        pet = Pet.create(image:"https://placekitten.com/200/300",
                          name: "Fluffy",
                          age: 9,
                          sex: "female",
                          shelter: shelter)


        visit "/shelters/#{shelter.id}/pets"

        click_link 'Add A New Pet'

        expect(current_path).to eq("/shelters/#{shelter.id}/pets/new")
        fill_in 'Image', with: "https://picsum.photos/id/200/1920/1280"
        fill_in 'Name', with: "Molly"
        fill_in 'Description', with: "Molly is wonderful."
        fill_in 'Age', with: 4

        click_on 'Create Pet'

        expect(current_path).to eq("/shelters/#{shelter.id}/pets")
        expect(page).to have_content("Molly")
      end
    end
  end
end
