class RemoveAddFinalPriceToReservation < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :AddFinalPriceToReservation
  end
end
