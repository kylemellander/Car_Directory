require('rspec')
require('vehicle')
require('dealership')

describe(Vehicle) do
  before() do
    Vehicle.clear()
  end

  describe('#make, #model, #year, #color') do
    it('returns the make, model and year of a vehicle') do
      new_vehicle = Vehicle.new('Kia', 'Hatchback', 2005, "blue")
      expect(new_vehicle.make()).to(eq('Kia'))
      expect(new_vehicle.model()).to(eq('Hatchback'))
      expect(new_vehicle.year()).to(eq(2005))
      expect(new_vehicle.color()).to(eq("blue"))
    end
  end

  describe('#save, .all') do
    it('saves a vehicle with save method') do
      new_vehicle = Vehicle.new('Kia', 'Hatchback', 2005, "blue")
      new_vehicle.save()
      expect(Vehicle.all()).to(eq([new_vehicle]))
    end
  end

  describe('.clear') do
    it('clears the vehicle array of all vehicles') do
      new_vehicle = Vehicle.new('Kia', 'Hatchback', 2005, "blue")
      new_vehicle.save()
      Vehicle.clear()
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe('.delete') do
    it('deletes a specific vehicle by id') do
      new_vehicle = Vehicle.new('Kia', 'Spectra', 2005, "blue")
      new_vehicle.save()
      new_vehicle1 = Vehicle.new('Kia', 'Sedona', 2008, "white")
      new_vehicle1.save()
      Vehicle.delete(2)
      expect(Vehicle.all()).to(eq([new_vehicle]))
    end
  end

  describe('#age') do
    it('returns the age of the vehicle') do
      new_vehicle = Vehicle.new('Kia', 'Spectra', 2005, "blue")
      new_vehicle.save()
      expect(new_vehicle.age).to(eq(10))
    end
  end

  describe('#worth_buying') do
    it('returns a true or false on worthiness of vehicle') do
      new_vehicle = Vehicle.new('Kia', 'Spectra', 2005, "blue")
      expect(new_vehicle.worth_buying()).to(eq(true))
      new_vehicle2 = Vehicle.new('Chevy', 'Camaro', 1968, "red")
      expect(new_vehicle2.worth_buying()).to(eq(false))
    end
  end

  describe('.find') do
    it('finds a single vehicle in the Vehicles array') do
      new_vehicle = Vehicle.new('Kia', 'Spectra', 2005, "blue")
      new_vehicle.save()
      expect(Vehicle.find(2)).to(eq(nil))
      new_vehicle2 = Vehicle.new('Chevy', 'Camaro', 1968, "red")
      new_vehicle2.save()
      expect(Vehicle.find(2)).to(eq(new_vehicle2))
    end
  end

  describe('.find_by_color') do
    it('finds all vehicles by color input') do
      new_vehicle = Vehicle.new('Kia', 'Spectra', 2005, "blue")
      new_vehicle.save()
      expect(Vehicle.find_by_color("red")).to(eq([]))
      new_vehicle2 = Vehicle.new('Chevy', 'Camaro', 1968, "red")
      new_vehicle2.save()
      expect(Vehicle.find_by_color("red")).to(eq([new_vehicle2]))
    end
  end

end

describe(Dealership) do
  before() do
    Dealership.clear
  end

  describe("#name") do
    it("Creates new dealership under Dealership class") do
      new_dealership = Dealership.new("Bob's Crappy Cars")
      expect(new_dealership.name()).to(eq("Bob's Crappy Cars"))
    end
  end

  describe(".all") do
    it('starts the dealership array empty') do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a dealership to the dealership array') do
      new_dealership = Dealership.new('Kia Motors')
      new_dealership.save()
      expect(Dealership.all()).to(eq([new_dealership]))
    end
  end

  describe('.clear') do
    it('Clears the entire dealership list') do
      new_dealership = Dealership.new('Kia Motors')
      new_dealership.save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.delete') do
    it('deletes a dealership from the dealership array') do
      new_dealership = Dealership.new('Kia Motors')
      new_dealership.save()
      Dealership.delete(1)
      expect(Dealership.all()).to(eq([]))
    end
  end

end
