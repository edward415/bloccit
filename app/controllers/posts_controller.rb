class PostsController < ApplicationController

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new
    authorize @post
  end
  
  def create
     @topic = Topic.find(params[:topic_id])
     @post = current_user.posts.build(post_params)
     @post.topic = @topic
      if @post.save_with_initial_vote
        flash[:notice] = "Post was saved."
        redirect_to [@topic, @post]
      else
        flash[:error] = "There was an error saving the post. Please try again."
        render :new
      end
  end
  
  def edit
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
        authorize @post
  end

   def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
        authorize @post 
    if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
    end
   end
   
   def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.destroy
        flash[:notice] = "Post was successfully deleted."
        redirect_to @topic
    else
        flash[:error] = "Error deleting post, please try again."
        render :show
    end
end
   
   private
   
   def post_params
       params.require(:post).permit(:title, :body, :picture, :pictur_cache)
   end
  
end