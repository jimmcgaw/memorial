class EulogiesController < ApplicationController
  before_filter :load_memory 
  
  def create
    puts current_user.full_name
    @eulogy = @memory.eulogies.new(params[:eulogy])
    @eulogy.user = current_user
    if @eulogy.save
      redirect_to @memory, :notice => "Thanks for adding your eulogy."
    else
      redirect_to @memory, :alert => "Unable to add your eulogy."
    end
  end
  
  def destroy
    @eulogy = current_user.eulogies.find(params[:id])
    @eulogy.destroy
    redirect_to @memory, :notice => "Your eulogy has been removed."
  end
  
  private
  
  def load_memory
    @memory = Memory.find(params[:memory_id])
  end
end
