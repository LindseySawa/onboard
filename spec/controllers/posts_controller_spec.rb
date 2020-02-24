require 'rails_helper'

describe PostsController, type: :controller do
  describe 'GET #index' do

    it "responds to 200" do
      expect(response.status).to eq 200
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

  end

  describe 'GET #new' do
    it "responds to 200" do
      expect(response.status).to eq 200
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
    
  end

  describe 'GET #show' do
    let(:post) {FactoryBot.create :post}

    it 'responds to a request' do
      get :show, params: { id: post}
      expect(response.status).to eq 200
    end 

    it "renders the :show template" do
      get :show, params: {id: post}
      expect(response).to render_template :show
    end

  end   

end