FactoryBot.define do
  factory :addressable do
    address { Faker::Internet.ip_v4_address }
    location
  end
end
