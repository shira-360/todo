class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], task_id: comment_params[:task_id], user_id: current_user.id)
    redirect_to "/tasks/#{@comment.task.id}"   
  end

  private
  def comment_params
    params.permit(:text, :task_id)
  end
end
