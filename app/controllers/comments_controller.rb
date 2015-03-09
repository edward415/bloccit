class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post
    
    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Error saving comment, please try again."
      render 'posts/show'
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
 
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
