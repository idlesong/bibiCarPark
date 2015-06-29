class AddNodeIdAndHubIdToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :node_id, :integer
    add_column :registrations, :hub_id, :integer
  end
end
