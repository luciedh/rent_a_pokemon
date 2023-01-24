class UpdateDateColumnBookings < ActiveRecord::Migration[7.0]
  def change
    change_table :bookings do |t|
      t.remove :date
      t.datetime :start_date
    end
  end
end
