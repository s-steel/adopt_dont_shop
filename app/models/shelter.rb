class Shelter < ApplicationRecord
  has_many :pets

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  def pet_count
    self.pets.length
  end
end
