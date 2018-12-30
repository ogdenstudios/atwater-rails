class PagesController < ApplicationController

  def index
    @title = "The Atwater Group"
    @authors = Author.where(featured_author: true)
  end

  def about
    @title = "The Atwater Group | About"
  end

  def services
    @title = "The Atwater Group | Services"
  end

  def process_page
    @title = "The Atwater Group | Process"
  end

  def rates
    @title = "The Atwater Group | Rates"
  end

  def portfolio 
    @authors = Author.all.order('last_name')
    @title = "The Atwater Group | Portfolio"
  end

  def contact
    @title = "The Atwater Group | Contact"
  end
end
