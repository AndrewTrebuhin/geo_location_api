module V1
  class LocationResource < JSONAPI::Resource
    attributes :latitude,
               :longitude,
               :country,
               :country_code,
               :state,
               :state_code,
               :city,
               :postal_code,
               :data
  end
end
