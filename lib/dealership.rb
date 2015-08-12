class Dealership

  @@dealerships = []
  @@id_count = 0

  attr_reader :name, :id

  def initialize(name)
    @name = name
    @id = @@id_count + 1
    @@id_count += 1
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
end
