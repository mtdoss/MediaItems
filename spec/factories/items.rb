# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string           not null
#  ttype      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do 
  factory :item do
    title { Faker::Lorem.words(2).join(" ") }
    url { Faker::Internet.url } 
    ttype { ["image", "video", "website"].sample }
  end

end
