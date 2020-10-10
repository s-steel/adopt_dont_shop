require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the Shelter Index page and click 'New Shelter' link" do
    it "I can go to new page" do
      visit '/shelters'
      expect(page).to have_button('Add A New Shelter')
      click_button('Add A New Shelter')
      expect(current_path).to eq('/shelters/new')
      fill_in 'name', with: 'Test Shelter 1'
      fill_in 'address', with: '456 South St'
      fill_in 'city', with: 'Springfield'
      fill_in 'state', with: 'IL'
      fill_in 'zip', with: 85308

      click_button('Create Shelter')
      expect(current_path).to eq('/shelters')
      expect(page).to have_content("Test Shelter 1")

      expect(Shelter.last.address).to eq('456 South St')
      expect(Shelter.last.city).to eq('Springfield')
      expect(Shelter.last.state).to eq('IL')
      expect(Shelter.last.zip).to eq(85308)
    end
  end
end
