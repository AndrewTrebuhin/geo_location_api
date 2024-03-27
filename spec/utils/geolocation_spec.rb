# spec/models/geolocation_spec.rb
require 'rails_helper'

RSpec.describe Geolocation do
  describe '.search' do
    let(:ip_address) { '172.15.24.100' }
    let(:geocoder) { double }

    before do
      allow(described_class).to receive(:geocoder).and_return(geocoder)
    end

    it 'calls search method on geocoder with address' do
      expect(geocoder).to receive(:search).with(ip_address)
      described_class.search(ip_address)
    end
  end

  describe '.location_attrs_for' do
    let(:ip_address) { '172.15.24.100' }
    let(:result) { double('Result') }
    let(:response_dispatcher) { Geolocation::ResponseDispather }

    before do
      allow(described_class).to receive(:search).and_return([result])
    end

    context 'when result class is Geocoder::Result::Ipstack' do
      before do
        allow(response_dispatcher)
          .to receive(:dispatch)
          .with(result)
          .and_return(double(to_attributes: { latitude: 40.7128, longitude: -74.0060 }))
      end

      it 'calls dispatch method on ResponseDispatcher' do
        expect(response_dispatcher).to receive(:dispatch).with(result)
        described_class.location_attrs_for(address: ip_address)
      end

      it 'returns location attributes' do
        expect(described_class.location_attrs_for(address: ip_address)).to eq({ latitude: 40.7128, longitude: -74.0060 })
      end
    end

    context 'when result class is not Geocoder::Result::Ipstack' do
      let(:unknown_error) { Geolocation::ResponseDispather::UknownResultObjectError }

      before do
        allow(result).to receive(:class).and_return(Object)
      end

      it 'raises UnknownResultObjectError' do
        expect { described_class.location_attrs_for(address: ip_address) }.to raise_error(unknown_error)
      end
    end
  end
end
