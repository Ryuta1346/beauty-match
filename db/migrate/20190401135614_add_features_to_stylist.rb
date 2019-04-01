class AddFeaturesToStylist < ActiveRecord::Migration[5.2]
  def change
    add_column :stylists, :features, :string
  end
end
