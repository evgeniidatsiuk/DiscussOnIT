class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :all_tags, only: %i[create update]
  before_action :question, only: %i[new edit]

  def index
    questions
  end

  def new; end

  def create
    question = current_user.questions.build(question_params)
    if question.save
      Tag.all_tags(question, all_tags)
      redirect_to question_path(question.id)
    else
      render 'new'
    end
  end

  def show
    question.view += 1
    question.save
    @answers = question.answers.to_a - [Answer.find_by(id: question.right_answer_id)]
    @comments = question.comments
  end

  def edit; end

  def update
    if question.update(question_params)
      question.notificate('оновлено', current_user)
      Tag.all_tags(question, all_tags)
      redirect_to question_path(question.id)
    else
      render 'edit'
    end
  end

  def destroy
    question.destroy
    redirect_to questions_path
  end

  private

  def title
    @title = 'Запитання'
  end

  def question_params
    params.require(:question).permit(:user_id, :name, :text)
  end

  def question
    @question ||= Question.find_by(id: params[:id])
    @question ||= Question.new
  end

  def all_tags
    @all_tags ||= params[:question][:all_tags]
  end
end
