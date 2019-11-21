require "rails_helper"

RSpec.describe 'New Shelter' do
  describe 'As a visitor' do
    describe 'When I visit a new shelter form by clicking a link on the index' do
      it 'I can create a new shelter' do
        visit '/shelters'

        click_link 'Add A New Shelter'

        expect(current_path).to eq('/shelters/new')

        fill_in 'Name', with: "Puppies are Best"
        fill_in 'Address', with: "123 Main Street"
        fill_in 'City', with: "Broomfield"
        fill_in 'State', with: "CO"
        fill_in 'Zip', with: 80023
        click_on 'Create Shelter'

        expect(current_path).to eq("/shelters")
        expect(page).to have_content('Puppies are Best')
      end
    end
  end
end
