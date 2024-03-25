module V1
  class AddressResource < JSONAPI::Resource
    model_name 'Addressable'

    has_one :location, exclude_links: %i[self]

    attributes :address,
               :location_id

    def fetchable_fields
      super - %i[location_id]
    end
  end
end
