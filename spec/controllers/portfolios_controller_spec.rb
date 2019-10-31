require "rails_helper"

RSpec.describe PortfoliosController do
    describe "GET all" do
        it "works" do 
            get :all 
            expect(response.status).to eq(200)
        end
    end
    describe "GET show" do
        it "works"
    end
  end
  