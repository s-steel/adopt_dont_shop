class RemoveShelterWhereLocatedFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :shelter_where_located, :string
  end
end
