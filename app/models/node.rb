class Node < ActiveRecord::Base
  has_many :registrations  # must be two
  has_many :hubs, :through => :registrations
end
