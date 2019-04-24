class AddOperationTimeToStylistReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :stylist_reservations, :operation_time, :integer
  end
end
