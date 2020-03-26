require 'rails_helper'

describe PostsController, type: :controller do
  describe '#index' do
    context "as a user not to login" do
      it "returns a 302 response" do
        get :index
        expect(response).to have_http_status "302"
      end
      
      it "redirects to the sign-in page" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
  
  describe "GET #show" do
    it "redirects to the dashboard" do
      get :show, params: { id: 1 }
    end
  end

  describe "GET #update" do
    it "redirects to the dashboard" do
      get :update, params: { id: 1 }
    end
  end

  describe "GET #edit" do
    it "redirects to the dashboard" do
      get :edit, params: { id: 1 }
    end
  end

  describe "GET #create" do
    it "redirects to the dashboard" do
      get :create
    end
  end

  describe "GET #destroy" do
    it "redirects to the dashboard" do
      get :destroy, params: { id: 1 }
    end
  end

  describe "GET #new" do
    it "redirects to the dashboard" do
      get :new
    end
  end

  describe "GET #search" do
    it "redirects to the dashboard" do
      get :search
    end
  end
end