require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
require('./lib/dealership')

also_reload('/lib/**/*.rb')



get('/') do
  @dealerships = Dealership.all()
  @vehicles = Vehicle.available_vehicles()
  erb(:index)
end

get('/vehicles') do
  @vehicle
end
