# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :session_token, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, length: { in: 6..18, allow_nil: true }
  validates :password_digest, presence: { message: "Password can't be blank" }
  
  before_validation :ensure_session_token

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password) 
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end

  
end
