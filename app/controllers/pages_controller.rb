class PagesController < ApplicationController
  
  def home
    @title = "Welcome"
    @memories = Memory.find(:all, :order => "created_at DESC", :limit => 10)
  end
  
  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

end
