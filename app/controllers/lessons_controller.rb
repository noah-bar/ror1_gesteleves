class LessonsController < ApplicationController
  def index
    if params[:filter] == 'all'
      @lessons = Lesson.all
    else
      @lessons = Lesson.active
    end
  end

  def show
    @lesson = Lesson.find params[:id]
    @exam = Exam.new
    @note = Note.new
    @note.exam = @exam
    @exam.lesson = @lesson
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params

    if @lesson.save
      flash[:success] = "Lesson created successfully"
      redirect_to @lesson
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update(lesson_params)
      flash[:success] = "Lesson updated successfully"
      redirect_to @lesson
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:success] = "Lesson deleted successfully"
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:semester_id, :teacher_id, :branch_id, :classroom_id)
  end
end
