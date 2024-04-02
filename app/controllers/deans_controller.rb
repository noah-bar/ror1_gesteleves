class DeansController < ApplicationController
  def index
    @deans = Dean.all
  end

  def show
    @dean = Dean.find params[:id]
  end

  def new
    @dean = Dean.new
  end

  def create
    puts dean_params
    @dean = Dean.new dean_params
    @dean.reset_password = true

    if @dean.save
      flash[:success] = "Dean created successfully"
      redirect_to deans_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dean = Dean.find(params[:id])
  end

  def update
    @dean = Dean.find(params[:id])

    if @dean.update(dean_params)
      flash[:success] = "Dean updated successfully"
      redirect_to @dean
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dean = Dean.find(params[:id])
    @dean.destroy
    flash[:success] = "Dean deleted successfully"
    redirect_to deans_path
  end

  private

  def dean_params
    params.require(:dean).permit(:first_name,:password, :last_name, :email, :city, :npa, :address, :role)
  end
end
