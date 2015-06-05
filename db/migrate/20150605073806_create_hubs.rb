class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.string :status
      t.string :hardware_id
      t.integer :max_nodes

      t.timestamps
    end
  end
end
