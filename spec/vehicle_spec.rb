require('rspec')
require('vehicle')



describe(Vehicle) do
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
end
