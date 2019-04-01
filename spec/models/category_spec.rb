require 'rails_helper'

RSpec.describe Category, type: :model do
  describe Category do
    it "is valid with a name" do
      expect(build(:category)).to be_valid
    end
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of(:name) }
end
