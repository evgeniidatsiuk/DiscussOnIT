class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, except: [:create]

  def create
    comment = current_user.comments.build(comment_params)
    redirect_back(fallback_location: root_path) if comment.save
  end

  def update
    comment.update(comment_params)
    # прописати повторний рендер елемента, для виводу помилки ... якщо поставив користувацьку валідацію буде не потрібним
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :text, :object_type, :object_id)
  end

  def comment
    @comment ||= current_user.comments.find(params[:id])
  end
end
