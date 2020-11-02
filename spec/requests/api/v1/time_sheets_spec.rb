require 'rails_helper'

RSpec.describe "Api::V1::TimeSheets", type: :request do
  describe "GET /api/v1/time_sheets" do
    it "works! (now write some real specs)" do
      get api_v1_time_sheets_path
      expect(response).to have_http_status(200)
    end
  end
end
