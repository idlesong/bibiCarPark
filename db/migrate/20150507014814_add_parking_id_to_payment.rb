class AddParkingIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :parking_id, :integer
  end
end
