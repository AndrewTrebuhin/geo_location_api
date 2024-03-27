class Geolocation
  class ResponseDispather
    UknownResultObjectError = Class.new(JSONAPI::Exceptions::BadRequest)

    def self.dispatch(result)
      response =
        case result.class.to_s
        when 'Geocoder::Result::Ipstack'
          GeocoderResponse::Ipstack
        else
          raise UknownResultObjectError, 'Unknown result object. Geodata cannot be fetched.'
        end

      response.new(result)
    end
  end

  class << self
    def search(query)
      geocoder.search(query)
    end

    def location_attrs_for(address:)
      result = search(address).first
      ResponseDispather.dispatch(result).to_attributes
    end

    def geocoder
      Geocoder
    end
  end
end
