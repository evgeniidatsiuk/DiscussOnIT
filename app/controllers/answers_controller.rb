class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: %i[edit update destroy right]

  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question.id)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    redirect_to question_path(@answer.question.id) if @answer.update(answer_params)
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def right
    if @answer.question.user.id = current_user.id
      @answer.question.update(right_answer_id: @answer.id)
      redirect_to question_path(@answer.question.id)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :text)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
