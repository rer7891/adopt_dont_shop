require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "a can show a specific shelter by id" do
    shelter_1 = Shelter.create(name: "Best Shelter Denver")
    shelter_2 = Shelter.create(name: "Boulder Shelter Adopt")

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content(shelter_1.name)

    visit "/shelters/#{shelter_2.id}"
    expect(page).to have_content(shelter_2.name)
  end
end
