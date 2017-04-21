require 'rails_helper'

RSpec.describe MembersController, type: :controller do

  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "grabs all the members" do
      member = FactoryGirl.create(:member)
      get :index
      expect(assigns(:members)).to eq([member])
    end  

    it "renders the :index view" do
      member = FactoryGirl.create(:member)
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      params = { id: FactoryGirl.create(:member).id }
      get :edit, params: params
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the :new view" do
      member = FactoryGirl.create(:member)
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new member" do
        params = {"member": {"email": "john@john.com", "name": "sally sally"}}
        expect{
          post :create, params: params
        }.to change(Member,:count).by(1)
      end
    end
  end
end
