class FavoritesController < ApplicationController
	
	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)
		authorize favorite
		if favorite.save
			flash[:notice] = "Successfully favorited post."
			redirect_to [@post.topic, @post]
		else
			flash[:alert] = "Error favoriting, please try again."
		end
	end
	
	def destroy
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.find(params[:id])
		authorize favorite
		if favorite.destroy
			flash[:notice] = "Successfully unfavorited post."
			redirect_to [@post.topic, @post]
		else
			flash[:alert] = "Error deleting post, please try again."
		end
	end
end
