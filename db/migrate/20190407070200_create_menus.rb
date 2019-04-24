class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :stylist, foreign_key: true
      t.string :menu_name
      t.integer :menu_price
      t.integer :operation_time
      t.string :content
      t.text :memo

      t.timestamps
    end
  end
end
