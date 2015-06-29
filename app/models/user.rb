class User < ActiveRecord::Base
  before_create :generate_authentication_token

  validates :name,  presence: true
  validates :contact, presence: true, uniqueness: true

  has_secure_password
  validates :password, length: { minimum: 6 }

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break if !User.find_by(authentication_token: authentication_token)
    end
  end

  def reset_authentication_token!
    generate_authentication_token
    save
  end

end
