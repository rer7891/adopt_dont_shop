require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit /shelters/:shelter_id/pets" do
    before :each do
      @shelter = Shelter.create(name: "Best Shelter Broomfield",
                               address: "124 Main Street",
                               city: "Broomfield",
                               state: "CO",
                               zip: 80020)

      @shelter_1 = Shelter.create(name: "Best Shelter Broomfield",
                              address: "124 Main Street",
                              city: "Broomfield",
                              state: "CO",
                              zip: 80020)
      @pet_1 = Pet.create(image:"https://placekitten.com/200/300",
                       name: "Fluffy",
                       age: 1,
                       sex: "female",
                       shelter: @shelter)

      @pet_2 = Pet.create(image:"https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                       name: "Tootsy",
                       age: 1,
                       sex: "male",
                       shelter: @shelter_1)

    end

    it "I can see each Pet that can be adopted from that shelter" do

      visit "/shelters/#{@shelter.id}/pets"

      expect(page).to have_content(@pet_1.name)
      expect(page).to_not have_content(@pet_2.name)
    end

    it "can view each pet's picture" do
      visit "/shelters/#{@shelter.id}/pets"
      expect(page).to have_xpath("//img[@src='https://placekitten.com/200/300']")

      visit "/shelters/#{@shelter_1.id}/pets"
      expect(page).to have_xpath("//img[@src='https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80']")
    end

    it "user can update or delete each pets information" do

      visit "/pets"

      find("a[href='/pets/#{@pet_1.id}/edit']").click

      expect(current_path).to eql("/pets/#{@pet_1.id}/edit")

      visit "/pets"

      find("a[href='/pets/#{@pet_1.id}']").click
      expect(current_path).to eql("/pets")
      expect(page).to_not have_content(@pet_1.name)
    end

    it "can show a count of all animals" do

      visit "/shelters/#{@shelter.id}/pets"

      expect(page).to have_content("This shelter has #{@shelter.counts(@shelter.id)} pets up for adoption.")
    end
  end
end
