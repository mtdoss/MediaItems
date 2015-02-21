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

FactoryGirl.define do 
  factory :user do 
    username { Faker::Internet.user_name }
    password "password"

    factory :user_mark do
      username "mark"
    end

    factory :user_foo do
      username "foo bar"
    end 
  end 
end
