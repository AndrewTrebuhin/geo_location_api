JSONAPI.configure do |config|
  config.json_key_format = :underscored_key
  config.use_text_errors = true

  config.default_paginator = :paged
  config.default_page_size = 10
  config.maximum_page_size = 50

  config.exception_class_whitelist = [
    'Geolocation::ResponseDispather::UknownResultObjectError'
  ]
end
