class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_question, only: %i[show edit update destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    redirect_to root_path if @question.save
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit; end

  def update
    redirect_to root_path if @question.update(question_params)
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :name, :text)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
