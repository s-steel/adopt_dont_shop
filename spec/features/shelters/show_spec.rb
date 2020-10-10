require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the shelters/:id page" do
    it "I see the shelter with that id including the shelter's: name,
        address, city, state, zip" do
      shelter_1 = Shelter.create(name: "Test Shelter 1",
                                 address: "456 South St",
                                 city:  "Springfield",
                                 state:  "IL",
                                 zip:  35027
                                 )

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content("#{shelter_1.name}")
      expect(page).to have_content("#{shelter_1.address}")
      expect(page).to have_content("#{shelter_1.city}")
      expect(page).to have_content("#{shelter_1.state}")
      expect(page).to have_content("#{shelter_1.zip}")
    end
  end
end
