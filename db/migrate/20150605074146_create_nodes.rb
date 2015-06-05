class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :hardware_id
      t.string :status
      t.integer :main_hub
      t.integer :alt_hub
      t.integer :monitor
      t.integer :display

      t.timestamps
    end
  end
end
