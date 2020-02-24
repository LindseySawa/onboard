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
  
  describe 'GET #edit' do
    let(:post) {FactoryBot.create :post}

    it "successes a request" do
      get :edit, params: { id: post }
      expect(response.status).to eq 200
    end

    it "render the :edit template" do
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end

  # describe 'DELETE #destroy' do
  #   let(:user) {FactoryBot.create :user}

  #   it 'リクエストが成功すること' do
  #     delete :destroy, params: { id: user }
  #     expect(response.status).to eq 302
  #   end
  # end

end