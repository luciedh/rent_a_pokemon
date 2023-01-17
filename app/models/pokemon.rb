class Pokemon < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :name, uniqueness: true
end
