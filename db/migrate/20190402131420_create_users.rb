class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :tel, null: false
      t.integer :birth_year, null: false

      t.timestamps
    end
  end
end
