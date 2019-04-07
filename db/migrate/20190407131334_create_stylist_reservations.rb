class CreateStylistReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :stylist_reservations do |t|
      t.references :stylist, foreign_key: true
      t.references :menu, foreign_key: true
      t.datetime :book_time
      t.string :memo

      t.timestamps
    end
  end
end
