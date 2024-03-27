FactoryBot.define do
  factory :location do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    country { Faker::Address.country }
    country_code { Faker::Address.country_code }
    state { Faker::Address.state }
    state_code { Faker::Address.state_abbr }
    city { Faker::Address.city }
    postal_code { Faker::Address.zip }
  end
end
