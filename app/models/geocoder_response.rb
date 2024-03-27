class GeocoderResponse
  def initialize(result)
    @result = result
  end

  def data
    @data ||= @result&.data || {}
  end

  def to_attributes
    {
      latitude:,
      longitude:,
      country:,
      country_code:,
      state:,
      state_code:,
      city:,
      postal_code:,
      data:
    }
  end
end
