require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "can see a shelter's address by id" do
    shelter_1 = Shelter.create(id: 1,
                               name:      "Best Shelter",
                               address:   "124 Main Street",
                               city:      "Denver",
                               zip:       80020)

    # shelter_2 = Shelter.create(id: 2,
    #                            name:      "Broomfield Cat Shelter",
    #                            address:   "347 Foamy Way",
    #                            city:      "Broomfield",
    #                            zip:       80020)

    visit "/shelters/show"

    expect(page).to have_content(shelter_1.name)
  end
end
