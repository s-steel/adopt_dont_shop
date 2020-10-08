require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the Shelter Index page and click 'New Shelter' link" do
    it "I can go to new page" do
      visit '/shelters'
      expect(page).to have_link('New Shelter')
      click_link('New Shelter')
      expect(current_path)to eq('/shelters/new')
      fill_in 'name', with: 'Test Shelter 1'
      fill_in 'address', with: '456 South St'
      fill_in 'city', with: 'Springfield'
      fill_in 'state', with: 'IL'
      fill_in 'zip', with: '85308'

      click_button('Create Shelter')
      expect(current_path)to eq('/shelters')

      expect(page).to have_content("#{shelter_1.name}")
      expect(page).to have_content("#{shelter_1.address}")
      expect(page).to have_content("#{shelter_1.city}")
      expect(page).to have_content("#{shelter_1.state}")
      expect(page).to have_content("#{shelter_1.zip}")
    end
  end
end
