class TeachersController < ApplicationController
  load_and_authorize_resource
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
    puts teacher_params
    @teacher = Teacher.new teacher_params

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
      flash[:success] = "Teacher updated successfully"
      redirect_to @teacher
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    flash[:success] = "Teacher deleted successfully"
    redirect_to teachers_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name,:password, :last_name, :email, :city, :npa, :address, :role)
  end
end
