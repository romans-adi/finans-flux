class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
    @categories = Category.where(author_id: current_user.id)
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

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon).merge(author_id: current_user.id)
  end
end
