class PassengerMailer < ApplicationMailer
  default from: "no-replay@flightbooker.com"

  def thanks_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    @url  = booking_url(@booking)
    mail(to: @passenger.email, subject: 'Booking complete!')
  end

end
