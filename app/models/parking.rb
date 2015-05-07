class Parking < ActiveRecord::Base
  belongs_to :car
  has_one :payment
  validates :car, presence: true
  validates :enter_time, presence: true
end
