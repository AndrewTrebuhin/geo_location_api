class Location::Upserter
  def initialize(attrs = {})
    @attrs = attrs
  end

  def call
    Location.find_or_initialize_by(@attrs.slice(:latitude, :longitude)) do |loc|
      loc.assign_attributes(@attrs)
      loc.save
    end
  end
end
