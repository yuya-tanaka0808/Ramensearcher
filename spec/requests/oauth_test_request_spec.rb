require 'rails_helper'

RSpec.describe "OauthTests", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/oauth_test/index"
      expect(response).to have_http_status(:success)
    end
  end

end
