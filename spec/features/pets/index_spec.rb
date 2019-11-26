require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  before :each do
    @shelter = Shelter.create(name: "Best Shelter Broomfield",
                               address: "124 Main Street",
                               city: "Broomfield",
                               state: "CO",
                               zip: 80020)

    @pet_1 = Pet.create(image:"http://yourdost-blog-images.s3-ap-southeast-1.amazonaws.com/wp-content/uploads/2016/01/03165939/Dogs.jpg",
                      name: "Toto",
                      age: 10,
                      sex: "Male",
                      shelter: @shelter,
                      status: "Pending")
    @pet_2 = Pet.create(image:"https://placekitten.com/200/300",
                       name: "Fluffy",
                       age: 9,
                       sex: "Female",
                       shelter: @shelter)

  end

  describe "when I visit /pets" do
    it "can see each pet in the system" do

    visit '/pets'

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_1.shelter.name)
    expect(page).to have_content(@pet_2.shelter.name)
    end

    it "has an image that loads for each pet" do
      visit "/pets"
      expect(page).to have_xpath("//img[@src='https://placekitten.com/200/300']")
      expect(page).to have_xpath("//img[@src='http://yourdost-blog-images.s3-ap-southeast-1.amazonaws.com/wp-content/uploads/2016/01/03165939/Dogs.jpg']")
    end

    it "will put adoptable pets before pending pets" do
        visit '/pets'
        expect("#{@pet_2.name}").to appear_before("#{@pet_1.name}")
    end

    it "user can update or delete each pets information" do

      visit "/pets"

      within("p##{@pet_1.id}update") do
        click_link "Update Pet Info"
        expect(current_path).to eql("/pets/#{@pet_1.id}/edit")
      end


      visit "/pets"
      within("p##{@pet_1.id}delete") do
        click_link "Delete This Pet"
        expect(current_path).to eql("/pets")
      end
        expect(page).to_not have_content(@pet_1.name)
    end
  end
end
