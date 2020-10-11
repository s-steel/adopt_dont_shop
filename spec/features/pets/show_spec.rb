require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the pets/:id page" do
    it "I see the pet with that id including the pets's: image, name,
        description, approx age, sex, adoptionstatus" do
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

      expect(page).to have_content("Test Pet 1")
      expect(page).to have_xpath("//img[contains(@src, '#{pet_1.image}')]")
      expect(page).to have_content("good boy")
      expect(page).to have_content("5")
      expect(page).to have_content("Female")
      expect(page).to have_content("Adoptable")
    end
  end
end
