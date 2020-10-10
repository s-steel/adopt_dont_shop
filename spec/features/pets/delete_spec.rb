require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a pet show page and click 'Delete Pet'" do
    it "I can delete the pet" do
      shelter_1 = Shelter.create(name: "Test Shelter 1",
                                 address: "456 South St",
                                 city:  "Springfield",
                                 state:  "IL",
                                 zip:  35027
                                 )
     pet_1 = shelter_1.pets.create(image: "test image",
                        name: "Test Pet 1",
                        approximate_age:  "5",
                        sex:  "Female",
                        description: "good boy",
                        adoption_status: "Adoptable"
                        )
      visit "/pets/#{pet_1.id}"
      expect(page).to have_button('Delete Pet')
      click_button('Delete')
      expect(current_path).to eq("/pets")

      expect(page).to_not have_content('Test Pet 1')
      expect(page).to_not have_content('5')
      expect(page).to_not have_content('Female')
    end
  end
end
