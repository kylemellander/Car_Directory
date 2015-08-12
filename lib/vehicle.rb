class Vehicle
  @@vehicles = []
  @@id_count = 0

  attr_reader :make, :model, :year

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

end
