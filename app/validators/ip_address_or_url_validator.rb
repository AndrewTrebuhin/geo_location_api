class IpAddressOrUrlValidator < ActiveModel::EachValidator
  require 'ipaddr'

  def validate_each(record, attribute, value)
    return if valid_ip_address?(value) || valid_url?(value)

    record.errors.add(attribute, 'must be a valid IP address or URL')
  end

  private

  def valid_ip_address?(address)
    !!IPAddr.new(address) rescue false
  end

  def valid_url?(address)
    uri = URI.parse(address)
    uri.scheme.in?(%w[http https])
  rescue URI::InvalidURIError
    false
  end
end
