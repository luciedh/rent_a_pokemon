module PokemonConcern
  def booked_dates
    # renvoie un array d'array des dates de debut et de fin de tous les bookings du pokemon
    bookings.pluck(:start_date).map(&:to_date).map(&:to_s)
  end

  def flatpickr_booked_dates_object
    {
      dateFormat: "Y-m-d",
      disable: booked_dates
    }
  end
end
