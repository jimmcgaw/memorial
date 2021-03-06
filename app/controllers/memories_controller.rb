class MemoriesController < ApplicationController
  
  before_filter :authenticate, :except => [:show, :search]
  before_filter :correct_user, :only => [:edit, :update]
  
  # GET /memories
  # GET /memories.xml
  def index
    @memories = current_user.memories

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memories }
    end
  end
  
  def search
    @q = params[:q]
    @memories = Memory.search(@q)
    respond_to do |format|
      format.html
      format.xml { render :xml => @memories }
    end
  end

  # GET /memories/1
  # GET /memories/1.xml
  def show
    @memory = Memory.find(params[:id].to_i)
    @funerals = @memory.funerals
    @eulogies = @memory.eulogies
    @correct_user = @memory.user == current_user

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @memory }
    end
  end

  # GET /memories/new
  # GET /memories/new.xml
  def new
    @memory = Memory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @memory }
    end
  end

  # GET /memories/1/edit
  def edit
    @memory = current_user.memories.find(params[:id].to_i)
  end

  # POST /memories
  # POST /memories.xml
  def create
    @memory = Memory.new(params[:memory])
    @memory.user = current_user
    respond_to do |format|
      if @memory.save
        format.html { redirect_to(@memory, :notice => 'Memory was successfully created.') }
        format.xml  { render :xml => @memory, :status => :created, :location => @memory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @memory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memories/1
  # PUT /memories/1.xml
  def update
    @memory = Memory.find(params[:id].to_i)

    respond_to do |format|
      if @memory.update_attributes(params[:memory])
        format.html { redirect_to(@memory, :notice => 'Memory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @memory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /memories/1
  # DELETE /memories/1.xml
  def destroy
    @memory = Memory.find(params[:id].to_i)
    @memory.destroy

    respond_to do |format|
      format.html { redirect_to(memories_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = Memory.find(params[:id].to_i).user
    redirect_to(memories_path) unless current_user?(@user)
  end
end
