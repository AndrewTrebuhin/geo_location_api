Geocoder.configure(
  timeout: 5,
  lookup: :nominatim,
  ip_lookup: :ipstack,
  language: :en,
  api_key: ENV.fetch('IPSTACK_API_KEY')
)
