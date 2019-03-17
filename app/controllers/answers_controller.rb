class AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    answer
  end

  def create
    answer = current_user.answers.build(answer_params)
    if answer.save
      # сповіщення про створення нової відповіді
      question.chosens.each do |chosen|
        Notification.generate(chosen.user, answer, 'додана', current_user)
      end

      redirect_to question_path(question.id)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if answer.update(answer_params)
      question.chosens.each do |chosen|
        Notification.generate(chosen.user, answer, 'оновлена', current_user)
      end
      redirect_to question_path(question.id)
    else
      render 'edit'
    end
  end

  def destroy
    answer.destroy
    redirect_back(fallback_location: root_path)
  end

  def right
    answer = current_user.questions.find(question.id).answers.find(params[:id])
    # тільки власник питання може обрати правильне
    question.update(right_answer_id: answer.id)
    question.chosens.each do |chosen|
      Notification.generate(chosen.user, answer, 'обрана правильна відпоідь', current_user)
    end
    redirect_to question_path(question.id)
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :text)
  end

  def answer
    @answer ||= current_user.answers.find_by(id: params[:id])
    @answer ||= Answer.new
  end

  def question
    @question ||= @answer.question
  end
end
