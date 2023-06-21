class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      flash.now[:error] = @category.error.full_messages
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      flash.now[:error] = @category.error.full_messages
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
      def category_params
        params.require(:category).permit(:name)
      end

end
