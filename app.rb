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

post('/add_vehicle') do
  @make = params.fetch('make')
  @model = params.fetch('model')
  @year = params.fetch('year')
  @color = params.fetch('color')
  vehicle = Vehicle.new(@make, @model, @year, @color)
  vehicle.save()
  @dealerships = Dealership.all()
  @vehicles = Vehicle.available_vehicles()
  erb(:index)
end

post('/add_dealership') do
  @name = params.fetch('name')
  dealership = Dealership.new(@name)
  dealership.save()
  @dealerships = Dealership.all()
  @vehicles = Vehicle.available_vehicles()
  erb(:index)
end

post('/assign_vehicle/:vehicle_id') do
  @dealership_id = params.fetch('dealership_id').to_i
  @vehicle_id = params.fetch('vehicle_id').to_i
  @dealership = Dealership.find(@dealership_id)
  @dealership.add_car(@vehicle_id)
  @vehicles = []
  vehicles = @dealership.available_vehicles()
  vehicles.each do |v|
    @vehicles.push(Vehicle.find(v))
  end
  erb(:dealership)
end

get('/remove_vehicle/:vehicle_id') do
  @vehicle_id = params.fetch('vehicle_id').to_i
  Vehicle.mark_sold(@vehicle_id)
  @dealerships = Dealership.all()
  @vehicles = Vehicle.available_vehicles()
  erb(:index)
end

get('/dealership/:dealership_id') do
  @dealership_id = params.fetch('dealership_id').to_i
  @dealership = Dealership.find(@dealership_id)
  @vehicle_ids = @dealership.available_vehicles()
  @vehicles = []
  vehicles = @dealership.available_vehicles()
  vehicles.each do |v|
    @vehicles.push(Vehicle.find(v))
  end
  erb(:dealership)
end
