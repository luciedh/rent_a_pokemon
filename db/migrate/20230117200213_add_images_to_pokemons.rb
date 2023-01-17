class AddImagesToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :sprite_url, :string
    add_column :pokemons, :image_url, :string
  end
end
