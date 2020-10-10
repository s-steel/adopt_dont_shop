require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the shelters index page" do
    it "I see the name of each shelter in the system" do
      shelter_1 = Shelter.create(name: "Test Shelter 1",
                                 address: "456 South St",
                                 city:  "Springfield",
                                 state:  "IL",
                                 zip:  35027
                                 )
      shelter_2 = Shelter.create(name: "Test Shelter 2",
                                 address: "123 Main St",
                                 city:  "Louisville",
                                 state:  "KY",
                                 zip:  93421
                                 )
      visit '/shelters'

      # save_and_open_page
      # ^^adding this will open a page with what it looks like
      expect(page).to have_content("Shelters:")
      expect(page).to have_content("#{shelter_1.name}")
      expect(page).to have_content("#{shelter_2.name}")
    end
  end
end
