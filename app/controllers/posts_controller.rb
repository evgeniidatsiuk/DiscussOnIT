class PostsController < ApplicationController

  def index
    
  end

  def find_post
    @post = Post.find(params[:id])
  end
  

  def show
    
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

  def update
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def edit
    
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  
  def post_params
    params.require(:post).permit(:user_id, :name, :text)
  end

end
