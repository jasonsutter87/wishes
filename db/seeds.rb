30.times do
  User.create(first_name: Faker::Name.first_name,  username: Faker::Superhero.name, email: Faker::Internet.email, password: '123') 
end

10.times do
	Wish.create(user_id: rand(1..10), title: Faker::Lorem.word, content: Faker::Lorem.paragraph, price: 1)
end