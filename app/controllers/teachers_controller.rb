class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find params[:id]
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new teacher_params
    @teacher.reset_password = true

    if @teacher.save
      flash[:success] = "Teacher created successfully"
      redirect_to teachers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      redirect_to @teacher
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name,:password, :last_name, :email, :city, :npa, :address)
  end
end
