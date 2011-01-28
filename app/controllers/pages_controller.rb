class PagesController < ApplicationController
  
  def home
    @title = "Welcome"
    
    @memories = Memory.find(:all)
  end
  
  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

end
