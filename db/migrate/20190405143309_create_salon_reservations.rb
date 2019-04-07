class CreateSalonReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :salon_reservations do |t|
      t.references :salon, foreign_key: true
      t.datetime :book_time

      t.timestamps
    end
  end
end
