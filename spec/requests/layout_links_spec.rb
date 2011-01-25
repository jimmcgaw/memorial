require 'spec_helper'

describe "LayoutLinks" do
  describe "when not signed in" do
    it "should have a login link" do
      visit root_path
      response.should have_selector("a", :href => login_path, :content => "Login")
    end
    
  end
  
  describe "when signed in" do
    before(:each) do
      @user = Factory(:user)
      visit login_path
      fill_in :email, :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end
    
    it "should have a logout link" do
      visit root_path
      response.should have_selector("a", :href => logout_path, :content => "Logout")
    end
    
  end
end
