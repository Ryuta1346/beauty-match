class RemoveMenuFromStylistReservations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :stylist_reservations, :menu, foreign_key: true
  end
end
