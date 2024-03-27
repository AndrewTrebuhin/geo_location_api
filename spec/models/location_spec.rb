require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should have_many(:addressables) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end
end
