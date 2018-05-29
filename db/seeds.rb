# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = Airport.create([{name: "San Francisco O",code: "SFO"},
                            {name: "New York City",code: "NYC"},
                            {name: "Chicago O'hare",code: "CHO"}])

3.times do
  flights = Flight.create([{departure_id: 1, arrival_id: 2,
                            departure_time: Time.zone.now, duration: "6:35" },
                           {departure_id: 2, arrival_id: 3,
                            departure_time: Time.zone.now, duration: "6:35" },
                           {departure_id: 2, arrival_id: 1,
                            departure_time: Time.zone.now + 1.day, duration: "2:35" },
                           {departure_id: 1, arrival_id: 3,
                            departure_time: Time.zone.now + 2.day, duration: "1:35" },
                           {departure_id: 3, arrival_id: 2,
                            departure_time: Time.zone.now + 3.day, duration: "0:35" },
                           {departure_id: 3, arrival_id: 1,
                            departure_time: Time.zone.now + 4.day, duration: "8:35" }])
end
