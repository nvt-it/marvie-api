require 'rails_helper'

RSpec.describe "Api::V1::CustomerTransactions", type: :request do
  describe "GET /api/v1/customer_transactions" do
    it "works! (now write some real specs)" do
      get api_v1_customer_transactions_path
      expect(response).to have_http_status(200)
    end
  end
end
