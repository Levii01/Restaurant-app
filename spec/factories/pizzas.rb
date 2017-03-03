FactoryGirl.define do
  factory :pizza do
    name { Pizza::PIZZA_TYPE.sample }
    price { Faker::Number.decimal(2) }
    ingredients { [Faker::Food.ingredient, Faker::Food.ingredient, Faker::Food.ingredient].join(', ') }
    restaurant { FactoryGirl.create(:restaurant) }
  end
end
