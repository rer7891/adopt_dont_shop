require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
    shelter_1 = Shelter.create(name: "Best Shelter Denver",
                               address: "134 Main St",
                               city: "Denver",
                               state: "CO",
                               zip: 82420)

    shelter_2 = Shelter.create(name: "Boulder Shelter Adopt",
                               address: "232 Floyd Way",
                               city: "Boulder",
                               state: "CO",
                               zip: 80220)

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "has link names to a show page" do
    shelter_1 = Shelter.create(name: "Best Shelter Denver",
                               address: "134 Main St",
                               city: "Denver",
                               state: "CO",
                               zip: 82420)

    shelter_2 = Shelter.create(name: "Boulder Shelter Adopt",
                               address: "232 Floyd Way",
                               city: "Boulder",
                               state: "CO",
                               zip: 80220)

    visit "/shelters"
    expect(page).to have_link("Best Shelter Denver")
    expect(page).to have_link("Boulder Shelter Adopt")
  end

end
