FactoryGirl.define do
  factory :restaurant do
    name { Faker::StarWars.planet }
    address { Faker::Address.city + ", " + Faker::Address.street_address }
    opening_time "2017-03-01 8:30:00"
    closing_time "2017-03-01 18:00:05"
    opening_day "Monday"
    closing_day "Friday"
  end
end
