class CreateHubsAndNodes < ActiveRecord::Migration
  def change
    create_table :hubs_and_nodes, id: false do |t|
      t.belongs_to :hub, index: true
      t.belongs_to :node, index: true
    end
  end
end
