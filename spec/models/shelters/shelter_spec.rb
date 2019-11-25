require 'rails_helper'

describe Shelter, type: :model do
  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :address}
      it {should validate_presence_of :city}
      it {should validate_presence_of :state}
      it {should validate_presence_of :zip}
  end
  it "should be able to count all animals" do
    shelter = Shelter.create!(name: "Best Shelter Denver",
                               address: "134 Main St",
                               city: "Denver",
                               state: "CO",
                               zip: 82420)
    pet = Pet.create!(image:"https://placekitten.com/200/300",
                      name: "Fluffy",
                      age: 9,
                      sex: "female",
                      shelter: shelter)
    expect(shelter.counts("#{shelter.id}")).to eql(1)
  end
end
