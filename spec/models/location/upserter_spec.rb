# spec/models/location/upserter_spec.rb
require 'rails_helper'

RSpec.describe Location::Upserter do
  describe '#call' do
    context 'when location exists' do
      let!(:existing_location) { create(:location, latitude: 40.7128, longitude: -74.0060) }
      let(:attrs) { { latitude: 40.7128, longitude: -74.0060, country: 'United States' } }
      let(:upserter) { described_class.new(attrs) }

      it 'does not create a new location' do
        expect { upserter.call }.not_to change(Location, :count)
      end

      it 'returns the existing location' do
        expect(upserter.call).to eq(existing_location)
      end

      it 'does not update the existing location attributes' do
        expect(existing_location).not_to receive(:update)
        upserter.call
      end
    end

    context 'when location does not exist' do
      let(:attrs) { { latitude: 40.7128, longitude: -74.0060, country: 'United States' } }
      let(:upserter) { described_class.new(attrs) }

      it 'creates a new location' do
        expect { upserter.call }.to change(Location, :count).by(1)
      end

      it 'returns the newly created location' do
        expect(upserter.call).to be_a(Location)
      end

      it 'assigns attributes to the new location' do
        new_location = upserter.call
        expect(new_location).to have_attributes(
          latitude: 40.7128,
          longitude: -74.0060,
          country: 'United States'
        )
      end
    end
  end
end
