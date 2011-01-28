class PagesController < ApplicationController
  
  def home
    @memories = Memory.find(:all)
  end


end
