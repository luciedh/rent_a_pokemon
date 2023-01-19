# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "json"

GEN1 = "https://pokebuildapi.fr/api/v1/pokemon/generation/1"

pokemons_list = URI.open(GEN1).read
pokemons_serialized = JSON.parse(pokemons_list)

pokemons_serialized.each do | pokemon |

  Pokemon.create(
    name: pokemon['name'],
    image_url: pokemon['image'],
    sprite_url: pokemon['sprite']
  )
end

User.create(
  first_name: 'admin',
  last_name: 'admin',
  username: 'admin',
  email: 'admin@admin.com',
  password: 'adminadmin'
)
