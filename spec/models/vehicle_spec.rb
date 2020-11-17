require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  context 'Vehicle' do
    it 'create and destroy' do
      vehicle = described_class.create(
        license_plate: 'WSE1022',
        brand: 1,
        model: 'Mustang',
        year_model: 2020,
        year_manufacture: 2020
      )

      expect(vehicle.id).to eq 1

      vehicle.destroy

      expect(Vehicle.count).to eq 0
    end
  end
end
