require 'faker'
puts 'Seeds: start'
OPENING = %w( 08:00 08:30 09:00 09:30 10:00)
CLOSING = %w( 17:00 18:00 20:00 21:00)
RESTAURANT_NAME = %w(Hoth Kashyyyk Yavin Kamino Endor Corellia Devaron)
RESTAURANT_NAME.each do |name|
  Restaurant.create!(
  name: name,
  address: Faker::Address.street_address ,
  opening_time: OPENING.sample,
  closing_time: CLOSING.sample,
  opening_day: Restaurant::DAYS.first,
  closing_day: Restaurant::DAYS[rand(4)+3]
  )
end

Restaurant.all.each do |restaurant|
  9.times do |i|
    restaurant.pizzas.create!(
    name: Pizza::PIZZA_TYPE[i],
    price: Faker::Number.decimal(2),
    ingredients: [Faker::Food.ingredient, Faker::Food.ingredient, Faker::Food.ingredient].join(', ')
    ) if rand(2).zero?
  end
end

puts 'Seeds: finish'
