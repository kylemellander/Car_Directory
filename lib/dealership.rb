class Dealership

  @@dealership = []
  @@id_count = 0

  attr_reader :name, :id

  def initialize(name)
    @name = name
    @id = @@id_count + 1
    @@id_count += 1
  end

  define_singleton_method(:all) do
    @@dealership
  end

  

end
