require 'rails_helper'

RSpec.describe IpAddressOrUrlValidator do
  class TestModel
    include ActiveModel::Validations
    attr_accessor :address

    validates :address, ip_address_or_url: true
  end

  subject { TestModel.new }

  context 'when address is a valid IP address' do
    it 'passes validation' do
      subject.address = '192.168.0.1'
      expect(subject).to be_valid
    end
  end

  context 'when address is a valid URL' do
    it 'passes validation' do
      subject.address = 'http://example.com'
      expect(subject).to be_valid
    end
  end

  context 'when address is not a valid IP address or URL' do
    it 'fails validation' do
      subject.address = 'invalid'
      expect(subject).not_to be_valid
      expect(subject.errors[:address]).to include('must be a valid IP address or URL')
    end
  end
end
