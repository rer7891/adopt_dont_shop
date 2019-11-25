require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  before :each do
    @shelter = Shelter.create(name: "Best Shelter Broomfield",
                               address: "124 Main Street",
                               city: "Broomfield",
                               state: "CO",
                               zip: 80020)

    @pet = Pet.create(image:"https://placekitten.com/200/300",
                       name: "Fluffy",
                       age: 9,
                       sex: "female",
                       shelter: @shelter)
  end
  describe "when I visit /pets" do
    it "can see each pet in the system" do

    visit '/pets'

    expect(page).to have_content(@pet.name)
    end

    it "user can update or delete each pets information" do

      visit "/pets"
      click_link "Update Pet Info"
      expect(current_path).to eql("/pets/#{@pet.id}/edit")

      visit "/pets"
      click_link "Delete This Pet"
      expect(current_path).to eql("/pets")
      expect(page).to_not have_content(@pet.name)
    end
  end
end
