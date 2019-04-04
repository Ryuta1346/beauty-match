class CreateSalonReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :salon_reservations do |t|
      t.datetime :book_time
      t.references :salon, foreign_key: true
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
