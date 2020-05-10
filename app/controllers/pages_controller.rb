class PagesController < ApplicationController

  caches_action :index, :about, :services, :process_page, :rates, :contact, expires_in: 72.hours

  def index
    @title = "The Atwater Group | Home"
    @authors = Author.where(featured_author: true).sort_by { |author| author.last_name }
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

  def contact
    @title = "The Atwater Group | Contact"
    @slug = "contact"
  end

  def pay
    @title = "The Atwater Group | Pay"
    @slug = "pay"
  end
end
