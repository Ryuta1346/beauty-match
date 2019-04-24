class CreateStylists < ActiveRecord::Migration[5.2]
  def change
    create_table :stylists do |t|
      t.references :salon, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.string :tel
      t.integer :stylist_since
      t.string :activity_scope
      t.integer :cut_price

      t.timestamps
    end
  end
end
