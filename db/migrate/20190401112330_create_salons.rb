class CreateSalons < ActiveRecord::Migration[5.2]
  def change
    create_table :salons do |t|
      t.references :category, foreign_key: true
      t.references :prefecture, foreign_key: true
      t.string :manage
      t.string :tel
      # t.string :email
      t.integer :num_of_stylists
      t.integer :num_of_sheets
      t.string :features
      t.integer :cut_price

      t.timestamps
    end
  end
end
