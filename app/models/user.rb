class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password
  after_save :clear_password

  EMAIL_REGEX = /@/
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password, confirmation: true
  # Only on Create so other actions like update password attribute can be nil
  validates_length_of :password, in: 6..20, on: :create

  def self.authenticate(email = "", login_password = "")
    if EMAIL_REGEX.match(email)
      user = User.find_by_email(email)
    else
      return false
    end
    # else
    #   user = User.find_by_username(email)
    # end
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password = "")
    self.encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def encrypt_password
    return false if password.blank? # <- Guard clause
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
  end

  def clear_password
    self.password = nil
  end
end
