require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #show" do
  #   # let!(:user){create(:user)}
  #   # let!(:salon){create(:salon)}
  #   # let!(:salon_reservation){create(:salon_reservation, salon: salon)}
  #   # let!(:stylist){create(:stylist)}
  #   # let!(:stylist_resevation){create(:stylist_reservation, stylist: stylist)}
  #   # let!(:reservation) { create(:reservation, user: user, salon_reservation: salon_reservation, stylist_resevation: stylist_resevation) }
  #   it "returns http success" do
  #     get :show, params: { id: reservation.id }
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
