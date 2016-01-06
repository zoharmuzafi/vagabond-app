cities = City.create([{name: 'San Francisco', latitude: 0, longitude: 0, image: "sf.jpg", header: "sf_header.jpg"},
 											 {name: 'London', latitude: 0, longitude: 0, image: "london.jpg", header: "london_header.jpg"},
 											 {name: 'Gibraltar', latitude: 0, longitude: 0, image: "gibraltar.jpg", header: "gibraltar_header.jpg"},
 											 {name: 'Paris', latitude: 0, longitude: 0, image: "paris.jpg", header: "paris_header.jpg"}])

12.times do
	title = FFaker::Lorem.sentence
  body = FFaker::Lorem.paragraph
  city_id = rand(4) + 1
  post = Post.create({title: title, body: body, city_id: city_id, user_id: 1})
end


