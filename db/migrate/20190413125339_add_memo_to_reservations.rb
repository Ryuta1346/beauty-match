class AddMemoToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :salon_memo, :string
    add_column :reservations, :stylist_memo, :string
  end
end
