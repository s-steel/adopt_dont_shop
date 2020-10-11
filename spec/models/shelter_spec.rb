require 'rails_helper'

describe Shelter, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe 'relationships' do
    it { should have_many :pets }
  end
end

describe "instance methods" do
  it ".pet_count" do
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
   pet_2 = shelter_1.pets.create(image: "test image",
                      name: "Test Pet 2",
                      approximate_age:  "8",
                      sex:  "Male",
                      description: "bad boy",
                      adoption_status: "Pending"
                      )
    expect(shelter_1.pet_count).to eq(2)
  end
end
