require 'rails_helper'

RSpec.describe SalonReservationsController, type: :controller do
  let!(:salon) { create(:salon) }
  let!(:salon_reservation) { create(:salon_reservation, salon: salon) }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: { id: salon_reservation.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
