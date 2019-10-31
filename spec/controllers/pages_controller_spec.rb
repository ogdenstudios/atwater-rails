require "rails_helper"

RSpec.describe PagesController do
    describe "GET index" do
        it "works" do 
            get :index 
            expect(response.status).to eq(200)
        end
    end
    describe "GET about" do
        it "works"
    end
    describe "GET services" do
        it "works"
    end
    describe "GET process_page" do
        it "works"
    end
    describe "GET rates" do
        it "works"
    end
    describe "GET portfolio" do
        it "works"
    end
    describe "GET contact" do
        it "works"
    end
  end
  