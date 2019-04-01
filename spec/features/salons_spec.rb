require 'rails_helper'

RSpec.feature "Salons", type: :feature do
  let!(:category) { create(:category) }
  let!(:prefecture) { create(:prefecture) }
  let!(:salon) { create(:salon, category: category, prefecture: prefecture) }

  scenario "render salon page" do
    visit salon_path(salon.id)
    expect(page).to have_content "RAIMU"
  end
end