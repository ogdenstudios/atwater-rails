require "rails_helper"

RSpec.describe PagesController do
    describe "GET index" do
        it "works" do 
            get :index 
            expect(response.status).to eq(200)
        end
    end
    describe "GET about" do
        it "works" do 
            get :about 
            expect(response.status).to eq(200)
        end
    end
    describe "GET services" do
        it "works" do 
            get :services 
            expect(response.status).to eq(200)
        end
    end
    describe "GET process_page" do
        it "works" do 
            get :process_page 
            expect(response.status).to eq(200)
        end
    end
    describe "GET rates" do
        it "works" do 
            get :rates 
            expect(response.status).to eq(200)
        end
    end
    describe "GET contact" do
        it "works" do 
            get :contact 
            expect(response.status).to eq(200)
        end
    end
  end
  