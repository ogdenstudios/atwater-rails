require "rails_helper"

RSpec.describe AuthorsController do
    describe "GET index" do
      it "assigns @authors" do
        author = create(:author)
        get :index
        expect(assigns[:authors]).to eq([author])
      end
  
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end
  