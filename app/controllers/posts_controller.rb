class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts=Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
    redirect_to root_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
  
  end
  
  def update
    if @post.update(post_params)
      redirect_to root_path
    end
  end
  
  def destroy
    @post.destroy
    redirect_to root_path
  end
  
  private

  def post_params
    params.require(:post).permit(:user_id,:name,:text)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
