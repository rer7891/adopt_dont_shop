require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
    shelter_1 = Shelter.create(name: "Best Shelter Denver")

    shelter_2 = Shelter.create(name: "Boulder Shelter Adopt")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "has link names to a show page" do
    shelter_1 = Shelter.create(name: "Best Shelter Denver")

    shelter_2 = Shelter.create(name: "Boulder Shelter Adopt")

    visit "/shelters"
    expect(page).to have_link("Best Shelter Denver")
    expect(page).to have_link("Boulder Shelter Adopt")
  end

end
