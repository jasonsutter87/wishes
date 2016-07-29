30.times do
  User.create(
  	first_name: Faker::Name.first_name,
    username: Faker::Superhero.name,
    email: Faker::Internet.email,
    password: '123',
    wallet: 0) 
end

40.times do
	Wish.create(	
		user_id: rand(1..10),
		title: Faker::Commerce.department,
		content: Faker::StarWars.quote ,
		price: 1,
		url: "https://robohash.org/#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}.#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}.#{rand(0..9)}#{rand(0..9)}.#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}.png" )
end

