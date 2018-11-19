class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_comment,except:[:create]

	def create
		@comment = current_user.comments.build(comment_params)
    	if @comment.save
    		redirect_back(fallback_location: root_path)
    	end
	end

	def update
		if current_user.id==@comment.user.id
			if !@post.update(comment_params)
				#прописати повторний рендер елемента, для виводу помилки ... якщо поставив користувацьку валідацію буде не потрібним
			end
		end
		redirect_back(fallback_location: root_path)
	end

	def destroy
		if current_user.id==@comment.user.id
		@comment.destroy
		end
		redirect_back(fallback_location: root_path)
	end

	private

	def comment_params
    	params.require(:comment).permit(:user_id,:text,:object_type,:object_id)
  	end

  	def find_comment
    	@comment = Comment.find(params[:id])
  	end
end
