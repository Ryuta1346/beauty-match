require 'rails_helper'

RSpec.feature "Stylists", type: :feature do
  let!(:category){create(:category)}
  let!(:salon){create(:salon, category: category)}
  let!(:stylist){create(:stylist, category: category, salon: salon)}

  scenario "render admin/stylist page" do
    sign_in stylist
    visit admin_stylist_path
    expect(page).to have_content stylist.name
  end
end