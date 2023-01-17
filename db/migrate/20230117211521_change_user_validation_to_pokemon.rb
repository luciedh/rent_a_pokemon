class ChangeUserValidationToPokemon < ActiveRecord::Migration[7.0]
  def change
    change_column :pokemons, :user_id, :bigint, null: true
  end
end
