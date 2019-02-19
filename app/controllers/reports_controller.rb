class ReportsController < ApplicationController
  def new
 @report = Report.new
  end
  def create
    @report = Report.new(report_params)
    redirect_to report_path(@report.id) if @report.save
  else render "new"
  end

  def show
    @report = Report.find(params[:id])
  end

  def index
    @reports =  Report.all
  end

  private

  def report_params
  params.require(:report).permit(:user_email, :text, photos: [])
  end

end
