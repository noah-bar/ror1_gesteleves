class ExamsController < ApplicationController
  load_and_authorize_resource
  def show
    @exam = Exam.find params[:id]
  end

  def create
    @exam = Exam.new exam_params

    if @exam.save
      flash[:success] = "Exam created successfully"
      redirect_to @exam.lesson
    else
      @lesson = @exam.lesson
      render 'lessons/show', status: :unprocessable_entity
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    flash[:success] = "Exam deleted successfully"
    redirect_back(fallback_location: lessons_path)
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :weight, :date, :lesson_id)
  end
end
