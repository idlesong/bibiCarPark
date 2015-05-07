class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :contact
      t.string :sex
      t.integer :age
      t.string :group
      t.string :note

      t.timestamps
    end
  end
end
