require 'rails_helper'

RSpec.describe GeocoderResponse::Ipstack do
  let(:result_data) do
    {
      'latitude' => 40.7128,
      'longitude' => -74.0060,
      'country_name' => 'United States',
      'country_code' => 'US',
      'region_name' => 'New York',
      'region_code' => 'NY',
      'city' => 'New York City',
      'zip' => '10001'
    }
  end
  let(:result) { double('Result', data: result_data) }

  subject { described_class.new(result) }

  describe '#latitude' do
    it 'returns the latitude from result data' do
      expect(subject.latitude).to eq(result_data['latitude'])
    end
  end

  describe '#longitude' do
    it 'returns the longitude from result data' do
      expect(subject.longitude).to eq(result_data['longitude'])
    end
  end

  describe '#country' do
    it 'returns the country name from result data' do
      expect(subject.country).to eq(result_data['country_name'])
    end
  end

  describe '#country_code' do
  it 'returns the country code from result data' do
    expect(subject.country_code).to eq(result_data['country_code'])
  end
end

  describe '#state' do
    it 'returns the state name from result data' do
      expect(subject.state).to eq(result_data['region_name'])
    end
  end

  describe '#state_code' do
    it 'returns the state code from result data' do
      expect(subject.state_code).to eq(result_data['region_code'])
    end
  end

  describe '#city' do
    it 'returns the city name from result data' do
      expect(subject.city).to eq(result_data['city'])
    end
  end

  describe '#postal_code' do
    it 'returns the postal code from result data' do
      expect(subject.postal_code).to eq(result_data['zip'])
    end
  end

  describe '#to_attributes' do
    it 'returns a hash of attributes' do
      expected_attributes = {
        latitude: result_data['latitude'],
        longitude: result_data['longitude'],
        country: result_data['country_name'],
        country_code: result_data['country_code'],
        state: result_data['region_name'],
        state_code: result_data['region_code'],
        city: result_data['city'],
        postal_code: result_data['zip'],
        data: result_data
      }
      expect(subject.to_attributes).to eq(expected_attributes)
    end
  end
end
