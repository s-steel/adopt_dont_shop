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

      pet_1 = shelter_1.pets.create(image: "test image",
                         name: "Test Pet 1",
                         approximate_age:  "5",
                         sex:  "Female",
                         description: "good boy",
                         adoption_status: "Adoptable"
                         )
      visit '/pets'

      expect(page).to have_content("Pets:")
      expect(page).to have_xpath("//img[contains(@src, '#{pet_1.image}')]")
      expect(page).to have_content("Test Pet 1")
      expect(page).to have_content("5")
      expect(page).to have_content("Female")
      expect(page).to have_content("Test Shelter 1")
    end
  end
end

describe "As a visitor" do
  describe "When I visit the pets index page and click 'Update Pet'" do
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
      visit "/pets"
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
      expect(page).to have_xpath("//img[contains(@src, '#{pet_1.image}')]")
      expect(page).to have_content('3')
      expect(page).to have_content('Male')
      expect(page).to have_content('Adoptable')
    end
  end
end

describe "As a visitor" do
  describe "When I visit the pets index page and click 'Delete' link" do
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
      visit "/pets"
      expect(page).to have_button('Delete')
      click_button('Delete')
      expect(current_path).to eq("/pets")

      expect(page).to_not have_content('Test Pet 1')
      expect(page).to_not have_content('5')
      expect(page).to_not have_content('good boy')
    end
  end
end

describe "As a visitor" do
  describe "anywhere on the site, if I see a shelter name" do
    it "I can click it and be linked to its show page" do
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
      visit "/pets"
      expect(page).to have_link('Test Shelter 1')
      click_link('Test Shelter 1')
      expect(current_path).to eq("/shelters/#{shelter_1.id}")
    end
  end
end

describe "As a visitor" do
  describe "anywhere on the site, if I see a pet name" do
    it "I can click it and be linked to its show page" do
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
      visit "/pets"
      expect(page).to have_link('Test Pet 1')
      click_link('Test Pet 1')
      expect(current_path).to eq("/pets/#{pet_1.id}")
    end
  end
end

describe "As a visitor" do
  it "every page on the site will have a link to shelters index page" do
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
    visit "/pets"
    expect(page).to have_link('See All Shelters')
    click_link('See All Shelters')
    expect(current_path).to eq("/shelters")
  end
end
