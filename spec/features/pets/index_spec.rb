require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit /pets" do
    it "can see each pet in the system" do
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
    visit '/pets'

    expect(page).to have_content(pet.name)

    end
  end
end
