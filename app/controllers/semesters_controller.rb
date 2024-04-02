class SemestersController < ApplicationController
  def index
    if params[:filter] == 'all'
      @semesters = Semester.all
    else
      @semesters = Semester.active
    end
  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new semester_params

    if @semester.save
      redirect_to semesters_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @semester = Semester.find(params[:id])
  end

  def update
    @semester = Semester.find(params[:id])

    if @semester.update(semester_params)
      redirect_to @semester
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @semester = Semester.find(params[:id])
    @semester.destroy
    redirect_to semesters_path
  end

  private

  def semester_params
    params.require(:semester).permit(:year, :number)
  end
end
