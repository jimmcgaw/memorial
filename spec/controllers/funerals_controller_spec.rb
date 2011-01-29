require 'spec_helper'

describe FuneralsController do

  def mock_funeral(stubs={})
    (@mock_funeral ||= mock_model(Funeral).as_null_object).tap do |funeral|
      funeral.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all funerals as @funerals" do
      Funeral.stub(:all) { [mock_funeral] }
      get :index
      assigns(:funerals).should eq([mock_funeral])
    end
  end

  describe "GET show" do
    it "assigns the requested funeral as @funeral" do
      Funeral.stub(:find).with("37") { mock_funeral }
      get :show, :id => "37"
      assigns(:funeral).should be(mock_funeral)
    end
  end

  describe "GET new" do
    it "assigns a new funeral as @funeral" do
      Funeral.stub(:new) { mock_funeral }
      get :new
      assigns(:funeral).should be(mock_funeral)
    end
  end

  describe "GET edit" do
    it "assigns the requested funeral as @funeral" do
      Funeral.stub(:find).with("37") { mock_funeral }
      get :edit, :id => "37"
      assigns(:funeral).should be(mock_funeral)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created funeral as @funeral" do
        Funeral.stub(:new).with({'these' => 'params'}) { mock_funeral(:save => true) }
        post :create, :funeral => {'these' => 'params'}
        assigns(:funeral).should be(mock_funeral)
      end

      it "redirects to the created funeral" do
        Funeral.stub(:new) { mock_funeral(:save => true) }
        post :create, :funeral => {}
        response.should redirect_to(funeral_url(mock_funeral))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved funeral as @funeral" do
        Funeral.stub(:new).with({'these' => 'params'}) { mock_funeral(:save => false) }
        post :create, :funeral => {'these' => 'params'}
        assigns(:funeral).should be(mock_funeral)
      end

      it "re-renders the 'new' template" do
        Funeral.stub(:new) { mock_funeral(:save => false) }
        post :create, :funeral => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested funeral" do
        Funeral.should_receive(:find).with("37") { mock_funeral }
        mock_funeral.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :funeral => {'these' => 'params'}
      end

      it "assigns the requested funeral as @funeral" do
        Funeral.stub(:find) { mock_funeral(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:funeral).should be(mock_funeral)
      end

      it "redirects to the funeral" do
        Funeral.stub(:find) { mock_funeral(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(funeral_url(mock_funeral))
      end
    end

    describe "with invalid params" do
      it "assigns the funeral as @funeral" do
        Funeral.stub(:find) { mock_funeral(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:funeral).should be(mock_funeral)
      end

      it "re-renders the 'edit' template" do
        Funeral.stub(:find) { mock_funeral(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested funeral" do
      Funeral.should_receive(:find).with("37") { mock_funeral }
      mock_funeral.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the funerals list" do
      Funeral.stub(:find) { mock_funeral }
      delete :destroy, :id => "1"
      response.should redirect_to(funerals_url)
    end
  end

end
