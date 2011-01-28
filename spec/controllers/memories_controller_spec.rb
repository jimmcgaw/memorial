require 'spec_helper'

describe MemoriesController do
  render_views

  describe "GET 'new'" do
    
    describe "failure" do
      it "should require a logged in user" do
        get :new
        response.should redirect_to(login_path)
        flash[:notice].should =~ /Please sign in to access this page./i
      end
    end
    
    describe "success" do
      
    end
    
  end

end
