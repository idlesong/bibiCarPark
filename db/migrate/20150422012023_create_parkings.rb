class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
      t.datetime :enter_time
      t.datetime :exit_time
      t.datetime :park_time
      t.datetime :leave_time

      t.timestamps
    end
  end
end
