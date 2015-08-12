require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
require('./lib/dealership')

also_reload('/lib/**/*.rb')



get('/') do
  erb(:index)
end

get('/vehicles') do
  @vehicle
