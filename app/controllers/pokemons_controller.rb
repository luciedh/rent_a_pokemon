class PokemonsController < ApplicationController
  def index
    if params[:query].present?
      @pokemons = Pokemon.where("name ILIKE ?", "%#{params[:query]}%")
      @pokemons = Pokemon.where.not(user: nil) if @pokemons.empty?
    else
      # @pokemons = Pokemon.where.not(user: nil)
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

    pokemons_selected = params[:user][:pokemon_ids]
    pokemons_selected.shift
    pokemons_selected.each do | pokemon_id |
      pokemon = Pokemon.find(pokemon_id)
      pokemon[:user_id] = params[:id]
      pokemon.save
    end
    redirect_to user_path(current_user.id)
  end
end
