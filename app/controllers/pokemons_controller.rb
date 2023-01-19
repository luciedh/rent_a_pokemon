class PokemonsController < ApplicationController
  def index
    if params[:query].present?
      @pokemons = Pokemon.where("name ILIKE ?", "%#{params[:query]}%")
      @pokemons = Pokemon.all if @pokemons.empty?
    else
      @pokemons = Pokemon.all
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update(params[:pokemon])
  end
end
