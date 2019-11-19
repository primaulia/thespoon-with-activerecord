class AddChefNameToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :chef_name, :string
  end
end
