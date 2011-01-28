require 'spec_helper'

describe MemoriesController do

  def mock_memory(stubs={})
    (@mock_memory ||= mock_model(Memory).as_null_object).tap do |memory|
      memory.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all memories as @memories" do
      Memory.stub(:all) { [mock_memory] }
      get :index
      assigns(:memories).should eq([mock_memory])
    end
  end

  describe "GET show" do
    it "assigns the requested memory as @memory" do
      Memory.stub(:find).with("37") { mock_memory }
      get :show, :id => "37"
      assigns(:memory).should be(mock_memory)
    end
  end

  describe "GET new" do
    it "assigns a new memory as @memory" do
      Memory.stub(:new) { mock_memory }
      get :new
      assigns(:memory).should be(mock_memory)
    end
  end

  describe "GET edit" do
    it "assigns the requested memory as @memory" do
      Memory.stub(:find).with("37") { mock_memory }
      get :edit, :id => "37"
      assigns(:memory).should be(mock_memory)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created memory as @memory" do
        Memory.stub(:new).with({'these' => 'params'}) { mock_memory(:save => true) }
        post :create, :memory => {'these' => 'params'}
        assigns(:memory).should be(mock_memory)
      end

      it "redirects to the created memory" do
        Memory.stub(:new) { mock_memory(:save => true) }
        post :create, :memory => {}
        response.should redirect_to(memory_url(mock_memory))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved memory as @memory" do
        Memory.stub(:new).with({'these' => 'params'}) { mock_memory(:save => false) }
        post :create, :memory => {'these' => 'params'}
        assigns(:memory).should be(mock_memory)
      end

      it "re-renders the 'new' template" do
        Memory.stub(:new) { mock_memory(:save => false) }
        post :create, :memory => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested memory" do
        Memory.should_receive(:find).with("37") { mock_memory }
        mock_memory.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :memory => {'these' => 'params'}
      end

      it "assigns the requested memory as @memory" do
        Memory.stub(:find) { mock_memory(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:memory).should be(mock_memory)
      end

      it "redirects to the memory" do
        Memory.stub(:find) { mock_memory(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(memory_url(mock_memory))
      end
    end

    describe "with invalid params" do
      it "assigns the memory as @memory" do
        Memory.stub(:find) { mock_memory(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:memory).should be(mock_memory)
      end

      it "re-renders the 'edit' template" do
        Memory.stub(:find) { mock_memory(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested memory" do
      Memory.should_receive(:find).with("37") { mock_memory }
      mock_memory.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the memories list" do
      Memory.stub(:find) { mock_memory }
      delete :destroy, :id => "1"
      response.should redirect_to(memories_url)
    end
  end

end
