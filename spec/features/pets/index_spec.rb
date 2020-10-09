require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the pets index page" do
    it "I see each pet in the system including image, name, approx age, sex, shelter name" do
      shelter_1 = Shelter.create(name: "Test Shelter 1",
                                 address: "456 South St",
                                 city:  "Springfield",
                                 state:  "IL",
                                 zip:  35027
                                 )
      pet_1 = Shelter.pets.create(image: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.aspca.org%2Fsites%2Fdefault%2Ffiles%2Ffield%2Fimage%2Fblog-og-image%2Fblog_make-dogs-day_101619_fb.jpg&imgrefurl=https%3A%2F%2Fwww.aspca.org%2Fnews%2Fsubaru-shows-love-dogs-through-first-ever-national-make-dogs-day&tbnid=VxYKLltArvWpjM&vet=12ahUKEwi548icz6fsAhWWLM0KHaSLC0QQMygVegUIARD4AQ..i&docid=IGILl27W04eXpM&w=1200&h=630&q=dogs&ved=2ahUKEwi548icz6fsAhWWLM0KHaSLC0QQMygVegUIARD4AQ",
                         name: "Test Pet 1",
                         approximate_age:  "5",
                         sex:  "Female",
                         description: "good boy",
                         adoption_status: "Adoptable"
                         )
      visit '/pets'

      expect(page).to have_content("Pets:")
      expect(page).to have_content("https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.aspca.org%2Fsites%2Fdefault%2Ffiles%2Ffield%2Fimage%2Fblog-og-image%2Fblog_make-dogs-day_101619_fb.jpg&imgrefurl=https%3A%2F%2Fwww.aspca.org%2Fnews%2Fsubaru-shows-love-dogs-through-first-ever-national-make-dogs-day&tbnid=VxYKLltArvWpjM&vet=12ahUKEwi548icz6fsAhWWLM0KHaSLC0QQMygVegUIARD4AQ..i&docid=IGILl27W04eXpM&w=1200&h=630&q=dogs&ved=2ahUKEwi548icz6fsAhWWLM0KHaSLC0QQMygVegUIARD4AQ")
      expect(page).to have_content("Test Pet 1")
      expect(page).to have_content("5")
      expect(page).to have_content("Female")
      expect(page).to have_content("good boy")
      expect(page).to have_content("Adoptable")
    end
  end
end
