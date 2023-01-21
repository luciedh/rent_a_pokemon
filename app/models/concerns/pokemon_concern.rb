module PokemonConcern
  def booked_dates
  # renvoie un array des dates de tous les bookings du pokemon
    bookings.pluck(:date)
  end

  def simple_format_booked_dates
  # renvoie un array des dates
  # de tous les bookings du pokemon mais sous la forme stringifiée : "1991-12-28"
    booked_dates.map(&:to_s)
  end

  def booked_dates_json_objects
    simple_format_booked_dates.map do |booked_date|
    {
      date: booked_date
    }
    end
  end

  def flatpickr_booked_dates_object
    {
      dateFormat: "Y-m-d",
      disable: booked_dates_json_objects
    }
  end
end
