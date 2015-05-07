class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :unit_price
      t.integer :total_time
      t.integer :discount
      t.integer :total

      t.timestamps
    end
  end
end
