class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.where(author_id: current_user.id) || []
  end

  def show
    @category = Category.find(params[:id])
    @movements = @category.movements
    authorize! :read, @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.icon = if params[:category][:custom_icon_url].present?
                       params[:category][:custom_icon_url]
                     else
                       params[:category][:icon]
                     end

    if @category.save
      redirect_to categories_url, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to category_url(@category), notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon).merge(author_id: current_user.id)
  end
end
