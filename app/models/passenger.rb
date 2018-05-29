class Passenger < ApplicationRecord
  has_many :bookings
  has_many :flights

  validates :name , presence: true
  validates :email, presence: true
end
