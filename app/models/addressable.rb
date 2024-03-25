class Addressable < ApplicationRecord
  belongs_to :location

  validates :address, uniqueness: { case_sensitive: false }, ip_address_or_url: true
end
