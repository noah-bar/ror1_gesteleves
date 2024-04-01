class ClassroomsController < ApplicationController
  def index
    if params[:filter] == 'all'
      @classrooms = Classroom.all
    else
      @classrooms = Classroom.active
    end
  end

  def show
    @classroom = Classroom.find params[:id]
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new classroom_params

    if @classroom.save
      redirect_to @classroom
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @classroom = Classroom.find(params[:id])
  end

  def update
    @classroom = Classroom.find(params[:id])

    if @classroom.update(classroom_params)
      redirect_to @classroom
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :start_at, :end_at, :teacher_id,  student_ids: [])
  end
end
