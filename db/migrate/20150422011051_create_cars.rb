class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :plate
      t.string :type

      t.timestamps
    end
  end
end
