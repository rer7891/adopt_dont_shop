# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.destroy_all
Shelter.destroy_all


shelter_1 = Shelter.create(name: "Best Shelter Denver", address: "205 Flint Way", city: "Denver", state: "CO", zip: 80020 )
shelter_2 = Shelter.create(name: "Boulder Shelter Adopt", address: "123 Main Street", city: "Boulder", state: "CO", zip: 90320)

pet_1 = Pet.create(image:"https://placekitten.com/200/300",
                       name: "Fluffy",
                       age: 2,
                       sex: "female",
                       shelter: shelter_1,
                       description: "Fluffy is cute and cuddly. She needs a forever home
                        and would do well with children and other animals.")
pet_2 = Pet.create(image:"https://picsum.photos/id/237/200/300",
                      name: "Tootsy",
                      age: 2,
                      sex: "male",
                      shelter: shelter_2,
                      description: "Tootsy is house broken and knows how to sit! He needs a forever home
                       and would do well with children and other animals.")
pet_3 = Pet.create(image:"https://picsum.photos/id/1025/4951/3301",
                        name: "Turquoise",
                        age: 6,
                        sex: "female",
                        shelter: shelter_1,
                        description: "Turquoise is shy but sweet. She needs a forever home
                         preferably with a quiet older family.")
pet_4 = Pet.create(image:"https://picsum.photos/id/1074/5472/3648",
                      name: "Butters",
                      age: 5,
                      sex: "male",
                      shelter: shelter_2,
                      description: "Butters outgoing . She needs a forever home
                       and would do well with children and other animals.")
