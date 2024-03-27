class GeocoderResponse::Ipstack < GeocoderResponse
  def latitude
    data['latitude']
  end

  def longitude
    data['longitude']
  end

  def country
    data['country_name']
  end

  def country_code
    data['country_code']
  end

  def state
    data['region_name']
  end

  def state_code
    data['region_code']
  end

  def city
    data['city']
  end

  def postal_code
    data['zip']
  end
end
