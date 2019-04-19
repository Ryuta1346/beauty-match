class CreateStylists < ActiveRecord::Migration[5.2]
  def change
    create_table :stylists do |t|
      t.references :salon, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name, null: false
      t.string :tel, null: false
      t.integer :stylist_since, null: false
      t.string :activity_scope, null: false
      t.integer :cut_price, null: false

      t.timestamps
    end
  end
end
