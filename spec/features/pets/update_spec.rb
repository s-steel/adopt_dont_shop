require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the pet show page and click 'Update Pet'" do
    it "I can edit the pet" do
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
      expect(page).to have_button('Update Pet')
      click_button('Update Pet')
      expect(current_path).to eq("/pets/#{pet_1.id}/edit")
      fill_in 'name', with: 'Test dog 1'
      fill_in 'image', with: 'test image2'
      fill_in 'description', with: 'doggy'
      fill_in 'approximate_age', with: '3'
      select 'Male', from: :sex

      click_button('Update Pet')
      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content('Test dog 1')
      # expect(page).to have_content('test image2')
      expect(page).to have_content('3')
      expect(page).to have_content('Male')
      expect(page).to have_content('Adoptable')
    end
  end
end
