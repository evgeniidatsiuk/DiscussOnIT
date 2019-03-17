class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :all_tags, only: %i[create update]

  def index
    posts
  end

  def new
    post
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      Tag.all_tags(post, all_tags)
      redirect_to post_path(post.id)
    else
      render 'new'
    end
  end

  def show
    post.view += 1
    post.save
  end

  def edit; end

  def update
    if post.save
      Tag.all_tags(post, all_tags)
      redirect_to post_path(post.id)
    else
      render 'edit'
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path
  end

  private

  def title
    @title = 'Публікації'
  end

  def post_params
    params.require(:post).permit(:user_id, :name, :text)
  end

  def post
    @post ||= Post.find(params[:id]) unless params[:id].nil?
    @post ||= Post.new
  end

  def all_tags
    @all_tags ||= params[:post][:all_tags]
  end
end
