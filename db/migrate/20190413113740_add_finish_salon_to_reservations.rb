class AddFinishSalonToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :finish_salon, :boolean
    add_column :reservations, :finish_stylist, :boolean
  end
end
