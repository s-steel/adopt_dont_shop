require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the '/shelters/:shelter_id/pets' page" do
    it "I see each pet at that shelter with image, name, approx age, sex" do
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
      visit '/pets'

      expect(page).to have_content("Pets:")
      # expect(page).to have_content("test image")
      expect(page).to have_content("Test Pet 1")
      expect(page).to have_content("5")
      expect(page).to have_content("Female")
      expect(page).to have_content("Test Shelter 1")
    end
  end
end
