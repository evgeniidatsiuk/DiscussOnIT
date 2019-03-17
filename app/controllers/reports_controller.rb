class ReportsController < ApplicationController
  def index
    @reports = Report.all.order(created_at: :DESC).page(params[:page]).per(10)
  end

  def new
    report
  end

  def create
    report = Report.create(report_params)
    if report.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    report
  end

  private

  def report_params
    params.require(:report).permit(:user_email, :text, :subject, photos: [])
  end

  def report
    @report ||= Report.find_by(id: params[:id])
    @report ||= Report.new
  end
end
