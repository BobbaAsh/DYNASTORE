class AddStatusToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :status, :string
    add_column :reservations, :final_price, :float
  end
end
