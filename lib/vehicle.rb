class Vehicle
  @@vehicles = []
  @@id_count = 0

  attr_reader :make, :model, :year, :id

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
    @id = @@id_count + 1
    @@id_count += 1
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

end
