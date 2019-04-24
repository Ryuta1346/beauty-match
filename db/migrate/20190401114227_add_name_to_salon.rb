class AddNameToSalon < ActiveRecord::Migration[5.2]
  def change
    add_column :salons, :name, :string
  end
end
