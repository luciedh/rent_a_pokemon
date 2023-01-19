class Pokemon < ApplicationRecord

  belongs_to :user, optional: true
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

  def next
    Pokemon.where("id > ?", id).first
  end

  def prev
    Pokemon.where("id < ?", id).last
  end
end
