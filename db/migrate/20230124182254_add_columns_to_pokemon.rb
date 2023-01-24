class AddColumnsToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :pokedex_id, :integer
    add_column :pokemons, :hp, :integer
    add_column :pokemons, :attack, :integer
    add_column :pokemons, :defense, :integer
    add_column :pokemons, :speed, :integer
    add_column :pokemons, :type1, :text
    add_column :pokemons, :type2, :text
  end
end
