class PortfoliosController < ApplicationController
    caches_action :all, :show, expires_in: 72.hours
    def index
    end
    def all 
        @title = "The Atwater Group | Portfolio"
        @slug = "portfolio"
        @authors = Author.all
    end 
    def show 
        @title = "The Atwater Group | Portfolio"
        @filter = params[:slug]
        @books = Genre.find_by(slug: params[:slug]).books
    end
end