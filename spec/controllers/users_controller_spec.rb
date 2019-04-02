require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let!(:user){create(:user)}

    it "returns http success" do
      get :show, params: { id: user.id}
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
    let!(:user){create(:user)}

    it "returns http success" do
      get :edit, params: { id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

end
