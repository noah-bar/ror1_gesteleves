class BranchesController < ApplicationController
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
      redirect_to @branch
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def branch_params
    params.require(:branch).permit(:name)
  end
end
