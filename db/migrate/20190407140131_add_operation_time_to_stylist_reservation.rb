class AddOperationTimeToStylistReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :stylist_reservations, :operation_time, :integer, null: false
  end
end
