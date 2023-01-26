class PokemonsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR type1 ILIKE :query OR type2 ILIKE :query"
      @pokemons = Pokemon.where(sql_query, query: "%#{params[:query]}%")
      @pokemons = Pokemon.where.not(user: nil) if @pokemons.empty?
    else
      @pokemons = Pokemon.where.not(user: nil)
      @pokemons = Pokemon.all
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = Booking.new
  end

  def edit
    @user = current_user
    @pokemons = Pokemon.all
  end

  def update
    pokemons_all = Pokemon.all.find_all { |h| h[:user_id] == params[:id].to_i }
    pokemons_existing = pokemons_all.map { |h| h[:id].to_s }
    pokemons_selected = params[:user][:pokemon_ids]
    pokemons_selected.shift
    pokemons_uncheck = pokemons_existing - pokemons_selected
    pokemons_check  = pokemons_selected - pokemons_existing
    pokemons_check.each do |pokemon_id|
      pokemon = Pokemon.find(pokemon_id)
      pokemon[:user_id] = params[:id]
      pokemon.save
    end
    pokemons_uncheck.each do |pokemon_id|
      pokemon = Pokemon.find(pokemon_id)
      pokemon[:user_id] = nil
      pokemon.save
    end
    redirect_to user_path(current_user.id)
  end
end
