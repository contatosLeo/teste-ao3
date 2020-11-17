require 'rails_helper'

RSpec.describe Reserve, type: :model do
  context 'Reserve' do
    it 'create' do
      vehicle = Vehicle.create(
        license_plate: 'WSE1022',
        brand: 1,
        model: 'Mustang',
        year_model: 2020,
        year_manufacture: 2020
      )

      res = described_class.create(
        document: 39382722722,
        vehicle_id: vehicle.id
      )

      expect(res.id).to eq 1
    end
  end
end
