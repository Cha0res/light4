class DesignersController < ApplicationController
  def index
    @designers = Designer.page params[:page]
  end

  def show
    @designer = Designer.find(params[:id])
  end

  def new
    @designer = Designer.new
  end

  def create
    @designer = Designer.new(designer_params)
    if @designer.save
      redirect_to @designer
    else
      render 'new'
    end
  end

  def edit
    @designer = Designer.find(params[:id])
  end

  def update
    @designer = Designer.find(params[:id])

    if @designer.update(designer_params)
      redirect_to @designer
    else
      render 'edit'
    end
  end

  def destroy
    @designer = Designer.find(params[:id])
    @designer.destroy
    redirect_to designers_path
  end

  private
  def designer_params
    params.require(:designer).permit!
  end
end
