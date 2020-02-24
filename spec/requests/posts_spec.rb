require 'rails_helper'

describe PostsController, type: :controller do
  describe 'GET #show' do
    let(:post) {FactoryBot.create :post}

    it "responds to request" do
      get user_url post.id
      expect(response.status).to eq 200
    end
  end
end