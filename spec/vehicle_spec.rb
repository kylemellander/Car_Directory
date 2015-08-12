require('rspec')
require('vehicle')

describe(Vehicle) do
  before() do
    Vehicle.clear()
  end

  describe('#make, #model, #year') do
    it('returns the make, model and year of a vehicle') do
      new_vehicle = Vehicle.new('Kia', 'Hatchback', 2005)
      expect(new_vehicle.make()).to(eq('Kia'))
      expect(new_vehicle.model()).to(eq('Hatchback'))
      expect(new_vehicle.year()).to(eq(2005))
    end
  end

  describe('#save, .all') do
    it('saves a vehicle with save method') do
      new_vehicle = Vehicle.new('Kia', 'Hatchback', 2005)
      new_vehicle.save()
      expect(Vehicle.all()).to(eq([new_vehicle]))
    end
  end

  describe('.clear') do
    it('clears the vehicle array of all vehicles') do
      new_vehicle = Vehicle.new('Kia', 'Hatchback', 2005)
      new_vehicle.save()
      Vehicle.clear()
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe('.delete') do
    it('deletes a specific vehicle by id') do
      new_vehicle = Vehicle.new('Kia', 'Spectra', 2005)
      new_vehicle.save()
      new_vehicle1 = Vehicle.new('Kia', 'Sedona', 2008)
      new_vehicle1.save()
      Vehicle.delete(2)
      expect(Vehicle.all()).to(eq([new_vehicle]))
    end
  end

  describe('#age') do
    it('returns the age of the vehicle') do
      new_vehicle = Vehicle.new('Kia', 'Spectra', 2005)
      new_vehicle.save()
      expect(new_vehicle.age).to(eq(10))
    end
  end

end
