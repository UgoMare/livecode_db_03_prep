require 'faker'

50.times do
  Restaurant.create(name: Faker::Company.name, address: Faker::Address.city, votes: rand(100))
end
