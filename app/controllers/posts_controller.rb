class PostsController < ApplicationController
   before_action :signed_in_user, only: [:create, :destroy, :edit]
   before_action :correct_user,   only: [:destroy, :edit]

  def index
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      @feed_items = []
      redirect_to root_url  
    end
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    #@post = current_user.posts.find_by(id: params[:id])
  end
  
  def edit
    @post = current_user.posts.find_by(id: params[:id])
  end
  
  def update
    @post = current_user.posts.find_by(id: params[:id])
    if @post.update_attributes(post_params)
     flash[:success] = "Profile updated"
     redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end
  
  private
  
  def post_params
      params.require(:post).permit(:title, :content)
  end 
  
  def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
  
end
