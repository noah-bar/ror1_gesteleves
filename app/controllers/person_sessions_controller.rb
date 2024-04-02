class PersonSessionsController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.find_by(email: params[:email])

    if @person && @person.authenticate(params[:password])
      session[:user_id] = @person.id
      if @person.is_student?
        redirect_to student_path(@person.id)
      elsif @person.is_teacher?
        redirect_to lessons_path
      else
        redirect_to teachers_path
      end
    else
      flash[:error] = "Login failed"
      redirect_to new_person_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
