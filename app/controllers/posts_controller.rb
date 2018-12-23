class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @all_tags = params[:post][:all_tags]
    @post = current_user.posts.build(post_params)
    if @post.save
      Tag.all_tags(@post, @all_tags)
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
    
  end

  def show
    @post.view += 1
    @post.save
  end

  def edit; end

  def update
    redirect_to root_path if @post.update(post_params)
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :name, :text)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
