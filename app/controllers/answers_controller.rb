class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: %i[edit update destroy right]

  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      # сповіщення про створення нової відповіді
      @answer.question.chosens.each do |chosen|
        Notification.generate(chosen.user, @answer, 'create', current_user)
      end

      redirect_to question_path(@answer.question.id)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      @answer.question.chosens.each do |chosen|
        Notification.generate(chosen.user, @answer, 'update', current_user)
      end
      redirect_to question_path(@answer.question.id)
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy
    redirect_back(fallback_location: root_path)
  end

  def right
    # тільки власник питання може обрати правильне
    @answer.question.update(right_answer_id: @answer.id)
    @answer.question.chosens.each do |chosen|
      Notification.generate(chosen.user, @answer, 'select right answer', current_user)
    end
    redirect_to question_path(@answer.question.id)
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :text)
  end

  def find_answer
    @answer = current_user.answers.find(params[:id])
  end
end
