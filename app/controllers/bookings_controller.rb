class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = Booking.new
    @num_passengers = params[:booking][:num_tickets].to_i
    @num_passengers.times { @booking.passengers.build }

    render :new
  end

  def create
    @booking = Booking.new(booking_params)
    @passengers = @booking.passengers

    if @booking.save
      @passengers.each do |passenger|
        PassengerMailer.with(booking: @booking, passenger: passenger).thanks_email.deliver_now
      end
     redirect_to @booking
    else
     flash.now[:danger] = "Something went wrong!"
     render :new
   end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
