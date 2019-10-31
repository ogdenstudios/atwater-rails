require "rails_helper"

RSpec.describe GenresController do
    include Devise::Test::ControllerHelpers
    describe "GET index" do
      it "assigns @genres" do
        genre = create(:genre)
        get :index
        expect(assigns[:genres]).to eq([genre])
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
        it "assigns genres" do 
            genre = create(:genre) 
            get :show, params: {id: genre.id}
            expect(assigns[:genre]).to eq(genre)
        end
        it "renders the show template" do 
            genre = create(:genre) 
            get :show, params: {id: genre.id}
            expect(response).to render_template("show")
        end
        it "responds to JSON requests" do
            genre = create(:genre) 
            get :show, params: {id: genre.id}, format: :json 
            expect(response.status).to eq(200)
         end
    end
    describe "GET new" do
        it "redirects an unauthenticated user" do 
            get :new 
            expect(response.status).to eq(302)
        end
        it "sets the genre" do 
            user = create(:user)
            sign_in user
            get :new 
            expect(assigns[:genre]).to_not eq(nil)
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
            genre = create(:genre)
            get :edit, params: {id: genre.id}
            expect(response.status).to eq(302)
        end
        it "assigns genres" do 
            genre = create(:genre)
            user = create(:user)
            sign_in user
            get :edit, params: {id: genre.id}
            expect(assigns[:genre]).to eq(genre)
        end
        it "renders the edit template" do 
            genre = create(:genre)
            user = create(:user)
            sign_in user
            get :edit, params: {id: genre.id}
            expect(response).to render_template("edit")
        end 
    end
    describe "POST create" do 
        it "redirects an unauthenticated user" do 
            genre = build(:genre)
            post :create, params: {genre: {name: genre.name}}
            expect(response.status).to eq(302)
        end
        it "assigns genre" do 
            genre = build(:genre)
            user = create(:user) 
            sign_in user
            post :create, params: {genre: {name: genre.name}}
            expect(assigns[:genre]).to_not eq(nil)
        end
        it "adds a new genre to the database on success" do 
            beginning_genres = Genre.count
            genre = build(:genre)
            user = create(:user) 
            sign_in user
            post :create, params: {genre: {name: genre.name}}
            expect(Genre.count).to eq(beginning_genres + 1)
        end 
        it "responds with a 201 on successful JSON request" do 
            genre = build(:genre)
            user = create(:user) 
            sign_in user
            post :create, params: {genre: {name: genre.name}}, format: :json
            expect(response.status).to eq(201)
        end
    end
    describe "PUT update" do 
        it "redirects an unauthenticated user" do 
            genre = create(:genre)
            post :update, params: {id: genre.id, genre: {name: genre.name}}
            expect(response.status).to eq(302)
        end
        it "assigns genre" do 
            genre = create(:genre)
            post :update, params: {id: genre.id, genre: {name: genre.name}}
            expect(assigns[:genre]).to eq(genre)
        end
        it "correctly updates genre" do 
            genre = create(:genre)
            user = create(:user) 
            sign_in user
            post :update, params: {id: genre.id, genre: {title: 'newname'}}
            expect(response.status).to eq(302)
        end 
        it "responds with a 200 on successful JSON request" do 
            genre = create(:genre)
            user = create(:user) 
            sign_in user
            post :update, params: {id: genre.id, genre: {title: 'newname'}}, format: :json
            expect(response.status).to eq(200)
        end
    end
    describe "DELETE destroy" do 
        it "redirects an unauthenticated user" do 
            genre = create(:genre)
            delete :destroy, params: {id: genre.id}
            expect(response.status).to eq(302)
        end
        it "correctly deletes an genre" do
            genre = create(:genre)
            initial_genre_count = Genre.count
            user = create(:user)
            sign_in user
            delete :destroy, params: {id: genre.id}
            expect(Genre.count).to eq(initial_genre_count - 1)
        end 
        it "responds with a 204 on a successful JSON request" do 
            genre = create(:genre) 
            user = create(:user) 
            sign_in user 
            delete :destroy, params: {id: genre.id}, format: :json
            expect(response.status).to eq(204)
        end
    end
  end
  