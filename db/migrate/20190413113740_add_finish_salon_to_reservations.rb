class AddFinishSalonToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :finish_salon, :boolean, default: false
    add_column :reservations, :finish_stylist, :boolean, default: false
  end
end
