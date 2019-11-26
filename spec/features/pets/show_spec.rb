require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit /pets/:id" do
    before :each do
      @shelter = Shelter.create(name: "Best Shelter Broomfield",
                               address: "124 Main Street",
                               city: "Broomfield",
                               state: "CO",
                               zip: 80020)

      @pet_1 = Pet.create(image:"https://placekitten.com/200/300",
                       name: "Fluffy",
                       description: "Fluffy is an amazing animal in need of a home.",
                       age: 1,
                       sex: "female",
                       shelter: @shelter)
    end

    it "I can see the pet details and adoption status" do
      visit "/pets/#{@pet_1.id}"

      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_1.description)
      expect(page).to have_content(@pet_1.status)
    end

    it "can view the pet's image" do
      visit "/pets/#{@pet_1.id}"
      expect(page).to have_xpath("//img[@src='https://placekitten.com/200/300']")
    end
  end
end
