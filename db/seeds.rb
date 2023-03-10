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

  pokemon_temp = Pokemon.new
    pokemon_temp.name = pokemon['name']
    pokemon_temp.image_url = pokemon['image']
    pokemon_temp.sprite_url = pokemon['sprite']
    pokemon_temp.pokedex_id = pokemon['pokedexId']
    if pokemon['apiTypes'].length > 1
      pokemon_temp.type1 = pokemon['apiTypes'][0]['name']
      pokemon_temp.type2 = pokemon['apiTypes'][1]['name']
    else
      pokemon_temp.type1 = pokemon['apiTypes'][0]['name']
    end
    pokemon_temp.hp = pokemon['stats']['HP']
    pokemon_temp.attack = pokemon['stats']['attack']
    pokemon_temp.defense = pokemon['stats']['defense']
    pokemon_temp.speed = pokemon['stats']['speed']
    pokemon_temp.save!
  end

User.create(
  first_name: 'admin',
  last_name: 'admin',
  username: 'admin',
  email: 'admin@admin.com',
  password: 'adminadmin'
)
