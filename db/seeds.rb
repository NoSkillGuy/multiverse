# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |universe_id|
	Universe.create(name: "universe_#{universe_id}")
end

10.times do |family_id|
	Family.create(name: "family_#{family_id}")
end

20.times do |person_id|
	Person.create(name: "person_#{person_id}", universe_id: rand(1..10), family_id: rand(2..10), power: [true,false].sample)
end

10.times do |person_id|
	Person.create(name: "personn_#{person_id}", universe_id: person_id+1, family_id: 1, power: [true,false].sample)
end

