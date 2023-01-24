class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
  validates :start_date, presence: true

end
