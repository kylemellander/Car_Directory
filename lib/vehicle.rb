class Vehicle
  @@vehicles = []
  @@id_count = 0

  attr_reader :make, :model, :year, :id, :color, :sold

  def initialize(make, model, year, color)
    @make = make
    @model = model
    @year = year
    @color = color
    @id = @@id_count + 1
    @@id_count += 1
    @sold = false
  end

  def save
    @@vehicles.push(self)
  end

  define_singleton_method(:all) do
    @@vehicles
  end

  define_singleton_method(:clear) do
    @@vehicles = []
    @@id_count = 0
  end

  define_singleton_method(:delete) do |id|
    vehicles_temp = []
    @@vehicles.each do |vehicle|
      if vehicle.id() != id
        vehicles_temp.push(vehicle)
      end
    @@vehicles = vehicles_temp
    end
  end

  def age
    current_year = Time.new.year()
    current_year - @year
  end

  def worth_buying
    if age() < 20
      true
    else
      false
    end
  end

  define_singleton_method(:find) do |id|
    found_vehicle = nil
    @@vehicles.each do |vehicle|
      if vehicle.id() == id
        found_vehicle = vehicle
      end
    end
    found_vehicle
  end

  define_singleton_method(:find_by_color) do |color|
    color_vehicles = []
    @@vehicles.each do |vehicle|
      if vehicle.color() == color
        color_vehicles.push(vehicle)
      end
    end
    color_vehicles
  end

  def mark_sold_vehicle
    @sold = true
  end

  define_singleton_method(:mark_sold)  do |id|
    new_vehicles = []
    @@vehicles.each do |vehicle|
      if vehicle.id() == id
        vehicle.mark_sold_vehicle()
      end
      new_vehicles.push(vehicle)
    end
    @@vehicles = new_vehicles
  end

end
