class User < ActiveRecord::Base
  validates :name,  presence: true
  validates :contact, presence: true, uniqueness: true

  has_secure_password
  validates :password, length: { minimum: 6 }
end
