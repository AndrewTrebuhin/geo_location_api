class Location::Upserter
  def initialize(attrs = {})
    @attrs = attrs
  end

  def call
    location = Location.find_or_initialize_by(@attrs.slice(:latitude, :longitude))
    location.update(@attrs) if location.new_record?
    location
  end
end
