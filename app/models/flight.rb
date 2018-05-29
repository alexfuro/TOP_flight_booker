class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: :Airport, foreign_key: :departure_id
  belongs_to :to_airport  , class_name: :Airport, foreign_key: :arrival_id
  has_many   :bookings

  def flight_date_formatted
    departure_time.strftime("%d-%m-%Y")
  end
end
