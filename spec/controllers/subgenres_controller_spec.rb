require "rails_helper"

RSpec.describe SubgenresController do
    include Devise::Test::ControllerHelpers
    describe "GET index" do
      it "assigns @subgenres" do
        subgenre = create(:subgenre)
        get :index
        expect(assigns[:subgenres]).to eq([subgenre])
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
        it "assigns subgenres" do 
            subgenre = create(:subgenre) 
            get :show, params: {id: subgenre.id}
            expect(assigns[:subgenre]).to eq(subgenre)
        end
        it "renders the show template" do 
            subgenre = create(:subgenre) 
            get :show, params: {id: subgenre.id}
            expect(response).to render_template("show")
        end
        it "responds to JSON requests" do
            subgenre = create(:subgenre) 
            get :show, params: {id: subgenre.id}, format: :json 
            expect(response.status).to eq(200)
         end
    end
    describe "GET new" do
        it "redirects an unauthenticated user" do 
            get :new 
            expect(response.status).to eq(302)
        end
        it "sets the subgenre" do 
            user = create(:user)
            sign_in user
            get :new 
            expect(assigns[:subgenre]).to_not eq(nil)
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
            subgenre = create(:subgenre)
            get :edit, params: {id: subgenre.id}
            expect(response.status).to eq(302)
        end
        it "assigns subgenres" do 
            subgenre = create(:subgenre)
            user = create(:user)
            sign_in user
            get :edit, params: {id: subgenre.id}
            expect(assigns[:subgenre]).to eq(subgenre)
        end
        it "renders the edit template" do 
            subgenre = create(:subgenre)
            user = create(:user)
            sign_in user
            get :edit, params: {id: subgenre.id}
            expect(response).to render_template("edit")
        end 
    end
    describe "POST create" do 
        it "redirects an unauthenticated user" do 
            subgenre = build(:subgenre)
            post :create, params: {subgenre: {name: subgenre.name}}
            expect(response.status).to eq(302)
        end
        it "assigns subgenre" do 
            subgenre = build(:subgenre)
            user = create(:user) 
            sign_in user
            post :create, params: {subgenre: {name: subgenre.name}}
            expect(assigns[:subgenre]).to_not eq(nil)
        end
        it "adds a new subgenre to the database on success" do 
            beginning_subgenres = Subgenre.count
            subgenre = build(:subgenre)
            user = create(:user) 
            sign_in user
            post :create, params: {subgenre: {name: subgenre.name}}
            expect(Subgenre.count).to eq(beginning_subgenres + 1)
        end 
        it "responds with a 201 on successful JSON request" do 
            subgenre = build(:subgenre)
            user = create(:user) 
            sign_in user
            post :create, params: {subgenre: {name: subgenre.name}}, format: :json
            expect(response.status).to eq(201)
        end
    end
    describe "PUT update" do 
        it "redirects an unauthenticated user" do 
            subgenre = create(:subgenre)
            post :update, params: {id: subgenre.id, subgenre: {name: subgenre.name}}
            expect(response.status).to eq(302)
        end
        it "assigns subgenre" do 
            subgenre = create(:subgenre)
            post :update, params: {id: subgenre.id, subgenre: {name: subgenre.name}}
            expect(assigns[:subgenre]).to eq(subgenre)
        end
        it "correctly updates subgenre" do 
            subgenre = create(:subgenre)
            user = create(:user) 
            sign_in user
            post :update, params: {id: subgenre.id, subgenre: {title: 'newname'}}
            expect(response.status).to eq(302)
        end 
        it "responds with a 200 on successful JSON request" do 
            subgenre = create(:subgenre)
            user = create(:user) 
            sign_in user
            post :update, params: {id: subgenre.id, subgenre: {title: 'newname'}}, format: :json
            expect(response.status).to eq(200)
        end
    end
    describe "DELETE destroy" do 
        it "redirects an unauthenticated user" do 
            subgenre = create(:subgenre)
            delete :destroy, params: {id: subgenre.id}
            expect(response.status).to eq(302)
        end
        it "correctly deletes an subgenre" do
            subgenre = create(:subgenre)
            initial_subgenre_count = Subgenre.count
            user = create(:user)
            sign_in user
            delete :destroy, params: {id: subgenre.id}
            expect(Subgenre.count).to eq(initial_subgenre_count - 1)
        end 
        it "responds with a 204 on a successful JSON request" do 
            subgenre = create(:subgenre) 
            user = create(:user) 
            sign_in user 
            delete :destroy, params: {id: subgenre.id}, format: :json
            expect(response.status).to eq(204)
        end
    end
  end
  