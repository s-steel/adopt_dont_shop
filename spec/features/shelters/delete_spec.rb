require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the Shelter show page and click 'Delete' link" do
    it "I can delete the shelter" do
      shelter_1 = Shelter.create(name: "Test Shelter 1",
                                 address: "456 South St",
                                 city:  "Springfield",
                                 state:  "IL",
                                 zip:  35027
                                 )
      visit "/shelters/#{shelter_1.id}"
      expect(page).to have_button('Delete')
      click_button('Delete')
      expect(current_path).to eq("/shelters")

      expect(page).to_not have_content('Test Shelter 2')
      expect(page).to_not have_content('Pensacola')
      expect(page).to_not have_content('FL')
    end
  end
end
