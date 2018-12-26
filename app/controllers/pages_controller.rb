class PagesController < ApplicationController

  def index
  end

  def about
  end

  def services
  end

  def process_page
  end

  def rates
  end

  def portfolio 
    @authors = Author.all
  end

  def contact
  end
end
