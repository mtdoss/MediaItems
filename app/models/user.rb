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

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end
end
