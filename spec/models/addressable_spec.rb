require 'rails_helper'

RSpec.describe Addressable, type: :model do
  subject { build(:addressable) }

  describe 'validations' do
    it { should belong_to(:location) }
    it { should validate_uniqueness_of(:address).case_insensitive }
  end
end
