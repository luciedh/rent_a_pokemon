class RemoveDetailFromPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :detail, :text
  end
end
