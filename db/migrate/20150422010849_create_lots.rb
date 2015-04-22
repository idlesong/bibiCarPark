class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :mark
      t.string :area
      t.string :coordinate

      t.timestamps
    end
  end
end
