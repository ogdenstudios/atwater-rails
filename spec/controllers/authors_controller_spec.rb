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
        it "renders the edit template" do 
            author = create(:author)
            user = create(:user)
            sign_in user
            get :edit, params: {slug: author.slug}
            expect(response).to render_template("edit")
        end 
    end
    describe "POST create" do 
        it "redirects an unauthenticated user" do 
            author = build(:author)
            post :create, params: {author: {first_name: author.first_name, last_name: author.last_name, slug: author.slug, featured_author: author.featured_author, testimonial: author.testimonial, website: author.website, full_name: author.full_name, visible: author.visible}}
            expect(response.status).to eq(302)
        end
        it "assigns author" do 
            author = build(:author)
            post :create, params: {author: {first_name: author.first_name, last_name: author.last_name, slug: author.slug, featured_author: author.featured_author, testimonial: author.testimonial, website: author.website, full_name: author.full_name, visible: author.visible}}
            expect(assigns[:author]).to_not eq(nil)
        end
        it "adds a new author to the database on success" do 
            beginning_authors = Author.count
            author = build(:author)
            user = create(:user) 
            sign_in user
            post :create, params: {author: {first_name: author.first_name, last_name: author.last_name, slug: author.slug, featured_author: author.featured_author, testimonial: author.testimonial, website: author.website, full_name: author.full_name, visible: author.visible}}
            expect(Author.count).to eq(beginning_authors + 1)
        end 
        it "responds with a 201 on successful JSON request" do 
            author = build(:author)
            user = create(:user) 
            sign_in user
            post :create, params: {author: {first_name: author.first_name, last_name: author.last_name, slug: author.slug, featured_author: author.featured_author, testimonial: author.testimonial, website: author.website, full_name: author.full_name, visible: author.visible}}, format: :json
            expect(response.status).to eq(201)
        end
    end
    describe "PUT update" do 
        it "redirects an unauthenticated user" do 
            author = create(:author)
            post :update, params: {slug: author.slug, author: {first_name: author.first_name, last_name: author.last_name, slug: author.slug, featured_author: author.featured_author, testimonial: author.testimonial, website: author.website, full_name: author.full_name, visible: author.visible}}
            expect(response.status).to eq(302)
        end
        it "assigns author" do 
            author = create(:author)
            post :update, params: {slug: author.slug, author: {first_name: author.first_name, last_name: author.last_name, slug: author.slug, featured_author: author.featured_author, testimonial: author.testimonial, website: author.website, full_name: author.full_name, visible: author.visible}}
            expect(assigns[:author]).to eq(author)
        end
        it "correctly updates author" do 
            author = create(:author)
            user = create(:user) 
            sign_in user
            post :update, params: {slug: author.slug, author: {first_name: 'newname'}}
            expect(response.status).to eq(302)
        end 
        it "responds with a 200 on successful JSON request" do 
            author = create(:author)
            user = create(:user) 
            sign_in user
            post :update, params: {slug: author.slug, author: {first_name: 'newname'}}, format: :json
            expect(response.status).to eq(200)
        end
    end
    describe "DELETE destroy" do 
        it "redirects an unauthenticated user" do 
            author = create(:author)
            delete :destroy, params: {slug: author.slug}
            expect(response.status).to eq(302)
        end
        it "correctly deletes an author" do
            author = create(:author)
            initial_author_count = Author.count
            user = create(:user)
            sign_in user
            delete :destroy, params: {slug: author.slug}
            expect(Author.count).to eq(initial_author_count - 1)
        end 
        it "responds with a 204 on a successful JSON request" do 
            author = create(:author) 
            user = create(:user) 
            sign_in user 
            delete :destroy, params: {slug: author.slug}, format: :json
            expect(response.status).to eq(204)
        end
    end
  end
  