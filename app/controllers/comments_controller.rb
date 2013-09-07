class CommentsController < ApplicationController
  def create
    @message = Message.find_by_id(params[:message_id])
    parameters = params.require(:comment).permit(:user_id, :content)
    @message.comments.create( parameters )
    flash.now[:notice] = "Комментарий успешно опубликован!"
    respond_to do |format|
      format.html { redirect_to :back }
      format.js do
        @comments = @message.comments.paginate(page: params[:page],:per_page => 10)
        @comment =  @message.comments.new
      end
    end
  end
  
  def destroy

  end
end