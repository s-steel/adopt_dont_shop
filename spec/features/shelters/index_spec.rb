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

      expect(page).to have_content("Shelters:")
      expect(page).to have_content("#{shelter_1.name}")
      expect(page).to have_content("#{shelter_2.name}")
    end
  end
end

describe "As a visitor" do
  describe "When I visit the Shelter index page and click 'Update Shelter' link" do
    it "I can edit the shelter" do
      shelter_1 = Shelter.create(name: "Test Shelter 1",
                                 address: "456 South St",
                                 city:  "Springfield",
                                 state:  "IL",
                                 zip:  35027
                                 )
      visit "/shelters/"
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

describe "As a visitor" do
  describe "When I visit the Shelter index page and click 'Delete' link" do
    it "I can delete the shelter" do
      shelter_1 = Shelter.create(name: "Test Shelter 1",
                                 address: "456 South St",
                                 city:  "Springfield",
                                 state:  "IL",
                                 zip:  35027
                                 )
      visit "/shelters"

      expect(page).to have_button('Delete')
      click_button('Delete')
      expect(current_path).to eq("/shelters")

      expect(page).to_not have_content('Test Shelter 2')
      expect(page).to_not have_content('Pensacola')
      expect(page).to_not have_content('FL')
    end
  end
end
