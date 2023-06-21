class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
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
      @category = Category.find(params[:id])
      if @category.present?
        @category.destroy
      end
      redirect_to root_url
  end



  private
      def category_params
        params.require(:category).permit(:name)
      end

end
