[
  {
    address: '74.12.42.44',
    location: {
      latitude: 43.70317077636719,
      longitude: -79.51219177246094,
      country: 'Canada',
      country_code: 'CA',
      state: 'Ontario',
      state_code: 'ON',
      city: 'Toronto',
      postal_code: 'M3H 6A7'
    }
  },
  {
    address: '70.12.45.47',
    location: {
      latitude: 39.10620880126953,
      longitude: -94.57328033447266,
      country: 'United States',
      country_code: 'US',
      state: 'Missouri',
      state_code: 'MO',
      city: 'Kansas City',
      postal_code: '64106'
    }
  },
  {
    address: '66.183.83.48',
    location: {
      latitude: 49.180938720703125,
      longitude: -122.81128692626953,
      country: 'Canada',
      country_code: 'CA',
      state: 'British Columbia',
      state_code: 'BC',
      city: 'Surrey',
      postal_code: 'V3R 0A1'
    }
  }
].each do |attrs|
  location = Location.find_or_create_by(attrs[:location])
  Addressable.find_or_create_by(address: attrs[:address], location_id: location.id)
end
