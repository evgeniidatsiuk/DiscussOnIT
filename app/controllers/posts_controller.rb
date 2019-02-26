class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = orders(Post.all).page(params[:page]).per(10)
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
    @all_tags = params[:post][:all_tags]
    if @post.save
      Tag.all_tags(@post, @all_tags)
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :name, :text)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
