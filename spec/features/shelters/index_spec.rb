require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name: "Best Shelter Denver",
                               address: "134 Main St",
                               city: "Denver",
                               state: "CO",
                               zip: 82420)

    @shelter_2 = Shelter.create(name: "Boulder Shelter Adopt",
                               address: "232 Floyd Way",
                               city: "Boulder",
                               state: "CO",
                               zip: 80220)
  end
  it "can see all shelters names" do

    visit "/shelters"

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end

  it "has link names to a show page" do

    visit "/shelters"
    expect(page).to have_link("Best Shelter Denver")
    expect(page).to have_link("Boulder Shelter Adopt")
  end

  it "has a link to edit or delete each shelter" do

    visit "/shelters"
    find("a[href='/shelters/#{@shelter_1.id}/edit']").click
    expect(current_path).to eql("/shelters/#{@shelter_1.id}/edit")
    visit "/shelters"

    within("li##{@shelter_1.id}") do
      click_link "Delete Shelter"
      expect(current_path).to eql("/shelters")
    end
    expect(page).to_not have_content(@shelter_1.name)

  end

end
