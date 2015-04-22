class AddCarIdToParkings < ActiveRecord::Migration
  def change
    add_column :parkings, :car_id, :integer
  end
end
