class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_question, only: %i[show edit update destroy]

  def index
    @questions = orders(if params[:search].nil?
                          Question.all
                        else
                          Question.search(params[:search]).records
                 end).page(params[:page]).per(10)
  end

  def new
    @question = Question.new
  end

  def create
    @all_tags = params[:question][:all_tags]
    @question = current_user.questions.build(question_params)
    if @question.save
      Tag.all_tags(@question, @all_tags)
      redirect_to question_path(@question.id)
    else
      render 'new'
    end
  end

  def show
    @question.view += 1
    @question.save
    @question = Question.find(params[:id])
    @answers = @question.answers.to_a - [Answer.find_by(id: @question.right_answer_id)]
    @comments = @question.comments
  end

  def edit; end

  def update
    @all_tags = params[:question][:all_tags]

    if @question.update(question_params)
      @question.chosens.each do |chosen|
        Notification.generate(chosen.user, @question, 'update', current_user)
      end
      Tag.all_tags(@question, @all_tags)
      redirect_to question_path(@question.id)
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :name, :text)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
