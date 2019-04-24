class AddPlaceToSalon < ActiveRecord::Migration[5.2]
  def change
    add_column :salons, :place, :string
  end
end
