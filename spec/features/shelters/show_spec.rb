require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "a can show a specific shelter by id" do

    shelter_1 = Shelter.create(name: "Best Shelter Denver",
                               address: "134 Main St",
                               city: "Denver",
                               state: "CO",
                               zip: 82420)

    shelter_2 = Shelter.create(name: "Best Shelter Denver",
                               address: "134 Main St",
                               city: "Denver",
                               state: "CO",
                               zip: 82420)

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content(shelter_1.name)

    visit "/shelters/#{shelter_2.id}"
    expect(page).to have_content(shelter_2.name)
  end
end
