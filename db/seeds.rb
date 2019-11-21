# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create(name: "Best Shelter Denver", address: "205 Flint Way", city: "Denver", state: "CO", zip: 80020 )
shelter_2 = Shelter.create(name: "Boulder Shelter Adopt", address: "123 Main Street", city: "Boulder", state: "CO", zip: 90320)
