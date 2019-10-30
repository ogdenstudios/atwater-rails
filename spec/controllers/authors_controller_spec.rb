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
    describe "GET show" do
        it "assigns authors" do 
            author = create(:author) 
            get :show, params: {slug: author.slug}
            expect(assigns[:author]).to eq(author)
        end
        it "renders the show template" do 
            author = create(:author) 
            get :show, params: {slug: author.slug}
            expect(response).to render_template("show")
        end
    end
    describe "GET new" do
        it "assigns authors"
        it "authenticates user"
        it "renders the new template" 
    end
    describe "GET edit" do 
        it "assigns authors"
        it "authenticates user"
        it "renders the edit template" 
    end
    describe "POST create" do 
        it "assigns authors"
        it "authenticates user"
        it "renders the new template" 
    end
    describe "PUT update" do 
        it "assigns authors"
        it "authenticates user"
        it "renders the new template" 
    end
    describe "DELETE destroy" do 
        it "assigns authors"
        it "authenticates user"
        it "renders the new template" 
    end
  end
  