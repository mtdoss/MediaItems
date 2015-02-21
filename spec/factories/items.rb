FactoryGirl.define do 
  factory :item do
    title { Faker::Lorem.words(2).join(" ") }
    url { Faker::Internet.url } 
    type { ["image", "video", "website"].sample }
  end

end
