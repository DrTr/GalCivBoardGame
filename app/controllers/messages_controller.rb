class MessagesController < ApplicationController
  before_action :admin, only: [:new, :edit, :upadte, :destroy]
  
  def new
  end
  
  def destroy
  end
  
  def show
    @message = Message.find_by_url_title(params[:id])
  end
  
  def index
    @messages = Message.paginate(page: params[:page], :per_page => 5)
  end
  
  def edit
    
  end
  
  def update
    
  end
end
