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
    @authors = Author.all.order('last_name')
  end

  def contact
  end
end
