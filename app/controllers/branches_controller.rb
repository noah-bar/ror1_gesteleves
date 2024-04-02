class BranchesController < ApplicationController
  load_and_authorize_resource
  def index
    @branches = Branch.all
  end

  def show
    @branch = Branch.find params[:id]
  end

  def new
    @branch = Branch.new
  end

  def create
    @branch = Branch.new branch_params

    if @branch.save
      flash[:success] = "Branch created successfully"
      redirect_to @branch
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def update
    @branch = Branch.find(params[:id])

    if @branch.update(branch_params)
      flash[:success] = "Branch updated successfully"
      redirect_to @branch
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy
    flash[:success] = "Branch deleted successfully"
    redirect_to branches_path
  end

  private

  def branch_params
    params.require(:branch).permit(:name)
  end
end
