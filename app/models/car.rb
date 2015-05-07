class Car < ActiveRecord::Base
  validates :plate, presence: true, uniqueness: true

  has_many :parkings, dependent: :destroy
end
