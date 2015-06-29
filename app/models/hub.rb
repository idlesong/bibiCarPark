class Hub < ActiveRecord::Base
  has_many :registrations
  has_many :nodes, :through => :registrations
end
