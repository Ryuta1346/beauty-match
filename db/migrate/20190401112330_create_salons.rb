class CreateSalons < ActiveRecord::Migration[5.2]
  def change
    create_table :salons do |t|
      t.references :category, foreign_key: true, null: false
      t.references :prefecture, foreign_key: true, null: false
      t.string :manage, null: false
      t.string :tel, null: false
      t.integer :num_of_stylists, null: false
      t.integer :num_of_sheets, null: false
      t.string :features, null: false
      t.integer :cut_price, null: false

      t.timestamps
    end
  end
end
