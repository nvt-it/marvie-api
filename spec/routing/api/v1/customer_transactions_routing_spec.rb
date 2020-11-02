require "rails_helper"

RSpec.describe Api::V1::CustomerTransactionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/customer_transactions").to route_to("api/v1/customer_transactions#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/customer_transactions/1").to route_to("api/v1/customer_transactions#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/customer_transactions").to route_to("api/v1/customer_transactions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/customer_transactions/1").to route_to("api/v1/customer_transactions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/customer_transactions/1").to route_to("api/v1/customer_transactions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/customer_transactions/1").to route_to("api/v1/customer_transactions#destroy", :id => "1")
    end
  end
end
