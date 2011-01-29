require "spec_helper"

describe FuneralsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/funerals" }.should route_to(:controller => "funerals", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/funerals/new" }.should route_to(:controller => "funerals", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/funerals/1" }.should route_to(:controller => "funerals", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/funerals/1/edit" }.should route_to(:controller => "funerals", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/funerals" }.should route_to(:controller => "funerals", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/funerals/1" }.should route_to(:controller => "funerals", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/funerals/1" }.should route_to(:controller => "funerals", :action => "destroy", :id => "1")
    end

  end
end
