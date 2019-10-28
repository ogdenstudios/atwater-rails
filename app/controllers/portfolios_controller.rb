class PortfoliosController < ApplicationController
    def all 
        @title = "The Atwater Group | Portfolio"
        @slug = "portfolio"
        @authors = Author.where(featured_author: true)
    end 
    def show 
        @title = "The Atwater Group | Portfolio"
        @filter = params[:slug]
        @books = Genre.find_by(slug: params[:slug]).books
    end
end