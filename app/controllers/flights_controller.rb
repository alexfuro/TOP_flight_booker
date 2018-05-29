class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map{ |airport| [airport.name, airport.id] }
    @departure_times = Flight.all.map{ |flight| [flight.flight_date_formatted] }.uniq

    unless params[:flight_search].nil?
      user_departure = DateTime.parse(params[:flight_search][:departure_time])
      #find all flights that match from_airport, to_airport and selected date
      @results = Flight.where(departure_id: params[:flight_search][:from_airport],
                                arrival_id: params[:flight_search][:to_airport],
                            departure_time: (user_departure.beginning_of_day..user_departure.end_of_day))
    end
  end
end
