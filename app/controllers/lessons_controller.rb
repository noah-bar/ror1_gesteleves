class LessonsController < ApplicationController
  load_and_authorize_resource
  def index
    @lessons = Lesson.includes([:branch, :teacher, :classroom, :semester])
    if current_user.type == 'Teacher'
      @lessons = @lessons.active.where('lessons.teacher_id = ?', current_user.id)
    elsif params[:filter] == 'all'
      @lessons = @lessons.all
    else
      @lessons = @lessons.active
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
