class AddMenuIdToReservation < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :menu
  end
end
