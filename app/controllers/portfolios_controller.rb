class PortfoliosController < ApplicationController
    caches_action :all, :show, expires_in: 72.hours
    def index
    end
    def all 
        @title = "The Atwater Group | Portfolio"
        @slug = "portfolio"
        @authors = Author.all.sort_by { |author| author.last_name }
    end 
    def show 
        @title = "The Atwater Group | Portfolio"
        @filter = params[:slug]
        genre_id = Genre.find_by(slug: params[:slug]).id
        @authors = Book.where(genre_id: genre_id).group_by { |book| book.author.full_name }.sort
    end
end