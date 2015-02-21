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
