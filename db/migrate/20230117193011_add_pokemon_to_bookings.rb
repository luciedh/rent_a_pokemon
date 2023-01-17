class AddPokemonToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :pokemon, null: false, foreign_key: true
  end
end
