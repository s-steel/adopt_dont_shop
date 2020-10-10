require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the Shelter Pets Index page and click 'Creat Pet'" do
    it "I can add a new pet" do
      shelter_1 = Shelter.create(name: "Test Shelter 1",
                                 address: "456 South St",
                                 city:  "Springfield",
                                 state:  "IL",
                                 zip:  35027
                                 )
      visit "/shelters/#{shelter_1.id}/pets"
      expect(page).to have_button('Create Pet')
      click_button('Create Pet')
      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
      fill_in 'name', with: 'Test dog 1'
      fill_in 'image', with: 'test image'
      fill_in 'description', with: 'doggy'
      fill_in 'approximate_age', with: '5'
      select 'Female', from: :sex

      click_button('Create Pet')
      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
      expect(page).to have_content("Pets Available For Adoption")
      expect(page).to have_content('Test dog 1')
      # expect(page).to have_content('test image')
      expect(page).to have_content('5')
      expect(page).to have_content('Female')
    end
  end
end
