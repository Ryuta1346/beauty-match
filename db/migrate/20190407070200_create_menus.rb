class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :stylist, foreign_key: true
      t.string :menu_name, null: false
      t.integer :menu_price, null: false
      t.integer :operation_time, null: false
      t.string :content, null: false
      t.text :memo, null: false

      t.timestamps
    end
  end
end
