class BookingsController < ApplicationController
  before_action :set_pokemon, only: %i[new create]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pokemon = @pokemon
    @booking.user = current_user
    @booking.save
    redirect_to "/bookings"
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to "/bookings"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date)
  end
end
