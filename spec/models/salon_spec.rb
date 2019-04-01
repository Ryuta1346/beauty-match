require 'rails_helper'

RSpec.describe Salon, type: :model do
  describe Salon do
    it "is valid with a name, manage, tel, email, num_of_stylists, num_of_sheets,features, cut_price" do
      expect(create(:salon)).to be_valid
    end
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_length_of :name }
  it { is_expected.to validate_presence_of :place }
  it { is_expected.to validate_uniqueness_of :place }
  it { is_expected.to validate_presence_of :manage }
  it { is_expected.to validate_length_of :manage }
  it { is_expected.to validate_presence_of :tel }
  it { is_expected.to validate_uniqueness_of :tel }
  it { is_expected.to validate_length_of :tel }
  it { is_expected.to validate_presence_of :num_of_stylists }
  it { is_expected.to validate_length_of :num_of_stylists }
  it { is_expected.to validate_presence_of :num_of_sheets }
  it { is_expected.to validate_length_of :num_of_sheets }
  it { is_expected.to validate_presence_of :features }
  it { is_expected.to validate_presence_of :cut_price }

end
