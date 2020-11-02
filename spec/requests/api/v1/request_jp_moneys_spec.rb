require 'rails_helper'

RSpec.describe "Api::V1::RequestJpMoneys", type: :request do
  describe "GET /api/v1/request_jp_moneys" do
    it "works! (now write some real specs)" do
      get api_v1_request_jp_moneys_path
      expect(response).to have_http_status(200)
    end
  end
end
