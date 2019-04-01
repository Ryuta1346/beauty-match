require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  describe Prefecture do
    it "is valid with a name" do
      expect(create(:prefecture)).to be_valid
    end
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of(:name) }
end

