require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the Shelter show page and click 'Update Shelter' link" do
    it "I can edit the shelter" do
      shelter_1 = Shelter.create(name: "Test Shelter 1",
                                 address: "456 South St",
                                 city:  "Springfield",
                                 state:  "IL",
                                 zip:  35027
                                 )
      visit "/shelters/#{shelter_1.id}"
      expect(page).to have_button('Update Shelter')
      click_button('Update Shelter')
      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
      fill_in 'name', with: 'Test Shelter 2'
      fill_in 'address', with: '654 North St'
      fill_in 'city', with: 'Pensacola'
      fill_in 'state', with: 'FL'
      fill_in 'zip', with: 90231

      click_button('Update Shelter')

      expect(current_path).to eq("/shelters/#{shelter_1.id}")
      expect(page).to have_content('Test Shelter 2')
      expect(Shelter.last.address).to eq('654 North St')
      expect(Shelter.last.city).to eq('Pensacola')
      expect(Shelter.last.state).to eq('FL')
      expect(Shelter.last.zip).to eq(90231)
    end
  end
end
