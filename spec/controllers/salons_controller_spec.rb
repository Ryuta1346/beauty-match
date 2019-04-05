require 'rails_helper'

RSpec.describe SalonsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let!(:salon) { create(:salon) }

    it "returns http success" do
      sign_in salon
      get :show, params: { id: salon.id }
      expect(response).to have_http_status(:success)
    end
  end
end
