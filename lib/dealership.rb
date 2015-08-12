class Dealership

  @@dealerships = []
  @@id_count = 0

  attr_reader :name, :id, :vehicles, :sold_cars

  def initialize(name)
    @name = name
    @vehicles = []
    @id = @@id_count + 1
    @@id_count += 1
    @sold_cars = []
  end

  define_singleton_method(:all) do
    @@dealerships
  end

  def save
    @@dealerships.push(self)
  end

  define_singleton_method(:clear) do
    @@dealerships = []
    @@id_count = 0
  end

  define_singleton_method(:delete) do |id|
    new_dealerships = []
    @@dealerships.each do |dealership|
      if dealership.id() != id
        new_dealerships.push(dealership)
      end
    end
    @@dealerships = new_dealerships
  end

  define_singleton_method(:find) do |id|
    found_dealership = nil
    @@dealerships.each do |dealership|
      if dealership.id() == id
        found_dealership = dealership
      end
    end
    found_dealership
  end

  def add_car(id)
    @vehicles.push(id)
  end

  def sell_car(id)
    new_sold_cars = []
    vehicles_left = []
    @vehicles.each do |vehicle_id|
      if vehicle_id == id
        new_sold_cars.push(vehicle_id)
      else
        vehicles_left.push(vehicle_id)
      end
    end
    @vehicles = vehicles_left
    @sold_cars = new_sold_cars
    Vehicle.mark_sold(id)
  end

end
