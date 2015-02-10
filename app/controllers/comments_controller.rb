class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments
    
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post
    
    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error saving comment, please try again."
      render 'posts/show'
    end
    
  end
end
