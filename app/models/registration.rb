class Registration < ActiveRecord::Base
  belongs_to :hub
  belongs_to :node
end
