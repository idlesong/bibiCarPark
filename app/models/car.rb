class Car < ActiveRecord::Base
  has_many :parkings, dependent: :destroy
end
