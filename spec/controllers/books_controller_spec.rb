require "rails_helper"

RSpec.describe BooksController do
    include Devise::Test::ControllerHelpers
    describe "GET index" do
      it "assigns @books" do
        book = create(:book)
        get :index
        expect(assigns[:books]).to eq([book])
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
        it "assigns books" do 
            book = create(:book) 
            get :show, params: {id: book.id}
            expect(assigns[:book]).to eq(book)
        end
        it "renders the show template" do 
            book = create(:book) 
            get :show, params: {id: book.id}
            expect(response).to render_template("show")
        end
        it "responds to JSON requests" do
            book = create(:book) 
            get :show, params: {id: book.id}, format: :json 
            expect(response.status).to eq(200)
         end
    end
    describe "GET new" do
        it "redirects an unauthenticated user" do 
            get :new 
            expect(response.status).to eq(302)
        end
        it "sets the book" do 
            user = create(:user)
            sign_in user
            get :new 
            expect(assigns[:book]).to_not eq(nil)
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
            book = create(:book)
            get :edit, params: {id: book.id}
            expect(response.status).to eq(302)
        end
        it "assigns books" do 
            book = create(:book)
            user = create(:user)
            sign_in user
            get :edit, params: {id: book.id}
            expect(assigns[:book]).to eq(book)
        end
        it "renders the edit template" do 
            book = create(:book)
            user = create(:user)
            sign_in user
            get :edit, params: {id: book.id}
            expect(response).to render_template("edit")
        end 
    end
    describe "POST create" do 
        it "redirects an unauthenticated user" do 
            book = build(:book)
            post :create, params: {book: {genre_id: book.genre_id, title: book.title, old_filename: book.old_filename, author_id: book.author_id, featured: book.featured, picture: book.picture, service: book.service, subgenre_id: book.subgenre_id}}
            expect(response.status).to eq(302)
        end
        it "assigns book" do 
            book = build(:book)
            post :create, params: {book: {genre_id: book.genre_id, title: book.title, old_filename: book.old_filename, author_id: book.author_id, featured: book.featured, picture: book.picture, service: book.service, subgenre_id: book.subgenre_id}}
            expect(assigns[:book]).to_not eq(nil)
        end
        it "adds a new book to the database on success" do 
            beginning_books = Book.count
            book = build(:book)
            user = create(:user) 
            sign_in user
            post :create, params: {book: {genre_id: book.genre_id, title: book.title, old_filename: book.old_filename, author_id: book.author_id, featured: book.featured, picture: book.picture, service: book.service, subgenre_id: book.subgenre_id}}
            expect(Book.count).to eq(beginning_books + 1)
        end 
        it "responds with a 201 on successful JSON request" do 
            book = build(:book)
            user = create(:user) 
            sign_in user
            post :create, params: {book: {genre_id: book.genre_id, title: book.title, old_filename: book.old_filename, author_id: book.author_id, featured: book.featured, picture: book.picture, service: book.service, subgenre_id: book.subgenre_id}}, format: :json
            expect(response.status).to eq(201)
        end
    end
    describe "PUT update" do 
        it "redirects an unauthenticated user" do 
            book = create(:book)
            post :update, params: {id: book.id, book: {genre_id: book.genre_id, title: book.title, old_filename: book.old_filename, author_id: book.author_id, featured: book.featured, picture: book.picture, service: book.service, subgenre_id: book.subgenre_id}}
            expect(response.status).to eq(302)
        end
        it "assigns book" do 
            book = create(:book)
            post :update, params: {id: book.id, book: {genre_id: book.genre_id, title: book.title, old_filename: book.old_filename, author_id: book.author_id, featured: book.featured, picture: book.picture, service: book.service, subgenre_id: book.subgenre_id}}
            expect(assigns[:book]).to eq(book)
        end
        it "correctly updates book" do 
            book = create(:book)
            user = create(:user) 
            sign_in user
            post :update, params: {id: book.id, book: {first_name: 'newname'}}
            expect(response.status).to eq(302)
        end 
        it "responds with a 200 on successful JSON request" do 
            book = create(:book)
            user = create(:user) 
            sign_in user
            post :update, params: {id: book.id, book: {first_name: 'newname'}}, format: :json
            expect(response.status).to eq(200)
        end
    end
    describe "DELETE destroy" do 
        it "redirects an unauthenticated user" do 
            book = create(:book)
            delete :destroy, params: {id: book.id}
            expect(response.status).to eq(302)
        end
        it "correctly deletes an book" do
            book = create(:book)
            initial_book_count = book.count
            user = create(:user)
            sign_in user
            delete :destroy, params: {id: book.id}
            expect(book.count).to eq(initial_book_count - 1)
        end 
        it "responds with a 204 on a successful JSON request" do 
            book = create(:book) 
            user = create(:user) 
            sign_in user 
            delete :destroy, params: {id: book.id}, format: :json
            expect(response.status).to eq(204)
        end
    end
  end
  