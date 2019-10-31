require "rails_helper"

RSpec.describe AuthorsController do
    include Devise::Test::ControllerHelpers
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
      it "responds to JSON requests" do 
        get :index, format: :json 
        expect(response.status).to eq(200)
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
        it "responds to JSON requests" do
            author = create(:author) 
            get :show, params: {slug: author.slug}, format: :json 
            expect(response.status).to eq(200)
         end
    end
    describe "GET new" do
        it "redirects an unauthenticated user" do 
            get :new 
            expect(response.status).to eq(302)
        end
        it "sets the author" do 
            user = create(:user)
            sign_in user
            get :new 
            expect(assigns[:author]).to_not eq(nil)
        end
        it "renders the new template" do 
            user = create(:user) 
            sign_in user
            get :new
            expect(response).to render_template("new")
        end
    end
    describe "GET edit" do 
        it "redirects an unauthenticated user" do 
            author = create(:author)
            get :edit, params: {slug: author.slug}
            expect(response.status).to eq(302)
        end
        it "assigns authors" do 
            author = create(:author)
            user = create(:user)
            sign_in user
            get :edit, params: {slug: author.slug}
            expect(assigns[:author]).to eq(author)
        end
        it "renders the edit template" 
        it "responds to JSON requests"
    end
    describe "POST create" do 
        it "assigns authors"
        it "authenticates user"
        it "renders the new template" 
        it "responds to JSON requests"
    end
    describe "PUT update" do 
        it "assigns authors"
        it "authenticates user"
        it "renders the new template" 
        it "responds to JSON requests"
    end
    describe "DELETE destroy" do 
        it "assigns authors"
        it "authenticates user"
        it "renders the new template" 
        it "responds to JSON requests"
    end
  end
  