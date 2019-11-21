require 'rails_helper'

RSpec.describe "As a visitor", :type :feature do
  describe "when I visit /pets" do
    it "can see each pet in the system" do
      pet_1 = Pet.create(name: "Fluffy",
                         age: 9,
                         sex: "female",
                         shelter_name: shelter_id.name)

    end
  end
end
