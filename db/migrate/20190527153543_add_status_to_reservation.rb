class AddStatusToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :AddFinalPriceToReservation, :string
  end
end
