require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
        
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "First Name", :with => ""
          fill_in "Last Name", :with => ""
          fill_in "Email", :with => ""
          fill_in "Password", :with => ""
          fill_in "Password Confirmation", :with => ""
          click_button
          response.should render_template("users/new")
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
        
      end
      
    end
    
    describe "success" do
      
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "First Name", :with => "New"
          fill_in "Last Name", :with => "User"
          fill_in "Email", :with => "mynewuser@example.com"
          fill_in "Password", :with => "foobar"
          fill_in "Password Confirmation", :with => "foobar"
          click_button
          response.should have_selector("div.flash.success", :content => "Thanks for signing up!")
          response.should render_template(root_path)
        end.should change(User, :count).by(1)
      end
      
    end
    
  end
  
end
