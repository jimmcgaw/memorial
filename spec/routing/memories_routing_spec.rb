require "spec_helper"

describe MemoriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/memories" }.should route_to(:controller => "memories", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/memories/new" }.should route_to(:controller => "memories", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/memories/1" }.should route_to(:controller => "memories", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/memories/1/edit" }.should route_to(:controller => "memories", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/memories" }.should route_to(:controller => "memories", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/memories/1" }.should route_to(:controller => "memories", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/memories/1" }.should route_to(:controller => "memories", :action => "destroy", :id => "1")
    end

  end
end
