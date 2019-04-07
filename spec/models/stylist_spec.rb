require 'rails_helper'

RSpec.describe Stylist, type: :model do
  let!(:category) { create(:category) }
  let!(:salon) { create(:salon, category: category) }

  it "is valid with a name, tel, email, stylist_since, activity_scope, cut_price" do
    expect(create(:stylist, salon: salon, category: category)).to be_valid
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of :name }
  it { is_expected.to validate_presence_of :tel }
  it { is_expected.to validate_uniqueness_of :tel }
  it { is_expected.to validate_length_of :tel }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :stylist_since }
  it { is_expected.to validate_presence_of :activity_scope }
  it { is_expected.to validate_presence_of :features }
  it { is_expected.to validate_presence_of :cut_price }
end
