class PagesController < ApplicationController

  def index
    @title = "The Atwater Group"
    @authors = Author.where(featured_author: true)
    @slug = "home"
  end

  def about
    @title = "The Atwater Group | About"
    @slug = "about"
  end

  def services
    @title = "The Atwater Group | Services"
    @slug = "services"
  end

  def process_page
    @title = "The Atwater Group | Process"
    @slug = "process"
  end

  def rates
    @title = "The Atwater Group | Rates"
    @slug = "rates"
  end

  def portfolio 
    @title = "The Atwater Group | Portfolio"
    @slug = "portfolio"
  end

  def contact
    @title = "The Atwater Group | Contact"
    @slug = "contact"
  end
end
