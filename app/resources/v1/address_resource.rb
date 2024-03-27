module V1
  class AddressResource < JSONAPI::Resource
    model_name 'Addressable'

    has_one :location, exclude_links: %i[self]

    attributes :address,
               :location,
               :location_id

    def location
      @model.location.slice(:latitude, :longitude, :country, :country_code,
                            :state, :state_code, :city, :postal_code)
    end

    before_save do
      find_or_create_location if location_id.nil?
    end

    def fetchable_fields
      super - %i[location_id]
    end

    private

    def find_or_create_location
      return unless address

      attrs = Geolocation.location_attrs_for(address:)
      location = Location::Upserter.new(attrs).call

      @model.assign_attributes(location_id: location.id)
    end
  end
end
