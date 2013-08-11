class CommentsController < ApplicationController
  def create
    @message = Message.find_by_id(params[:message_id])
    parameters = params.require(:comment).permit(:author, :content)
    @comment = @message.comments.build(parameters)
    @comment.save
    redirect_to :back
  end
  
  def destroy

  end
end