class ExamsController < ApplicationController
  def show
    @exam = Exam.find params[:id]
  end

  def create
    @exam = Exam.new exam_params

    if @exam.save
      redirect_to @exam.lesson
    else
      @lesson = @exam.lesson
      render 'lessons/show', status: :unprocessable_entity
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    redirect_to :back
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :weight, :date, :lesson_id)
  end
end
