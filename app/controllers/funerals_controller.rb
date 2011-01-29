class FuneralsController < ApplicationController
  
  before_filter :load_memory
  before_filter :authenticate, :except => [:show]
  before_filter :correct_user, :except => [:show]
  
  # GET /funerals
  # GET /funerals.xml
  def index
    @funerals = Funeral.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @funerals }
    end
  end

  # GET /funerals/1
  # GET /funerals/1.xml
  def show
    @funeral = Funeral.find(params[:id])
    @correct_user = @funeral.memory.user == current_user

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @funeral }
    end
  end

  # GET /funerals/new
  # GET /funerals/new.xml
  def new
    @funeral = Funeral.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @funeral }
    end
  end

  # GET /funerals/1/edit
  def edit
    @funeral = Funeral.find(params[:id])
  end

  # POST /funerals
  # POST /funerals.xml
  def create
    @funeral = Funeral.new(params[:funeral])
    @funeral.memory = @memory

    respond_to do |format|
      if @funeral.save
        format.html { redirect_to(memory_funerals_path(@memory), :notice => 'Funeral was successfully created.') }
        format.xml  { render :xml => @funeral, :status => :created, :location => @funeral }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @funeral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /funerals/1
  # PUT /funerals/1.xml
  def update
    @funeral = Funeral.find(params[:id])

    respond_to do |format|
      if @funeral.update_attributes(params[:funeral])
        format.html { redirect_to(memory_funerals_path(@memory), :notice => 'Funeral was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @funeral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /funerals/1
  # DELETE /funerals/1.xml
  def destroy
    @funeral = Funeral.find(params[:id])
    @funeral.destroy

    respond_to do |format|
      format.html { redirect_to(memory_funerals_path(@memory)) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def load_memory
    @memory = Memory.find(params[:memory_id].to_i)
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = Memory.find(params[:memory_id].to_i).user
    redirect_to(memories_path) unless current_user?(@user)
  end
end
