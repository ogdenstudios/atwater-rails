require "rails_helper"

RSpec.describe PortfoliosController do
    describe "GET all" do
        it "works" do 
            get :all 
            expect(response.status).to eq(200)
        end
    end
    describe "GET show" do
        it "works" do 
            genre = create(:genre) 
            get :show, params: {slug: genre.name}
            expect(response.status).to eq(200)
        end
    end
  end
  