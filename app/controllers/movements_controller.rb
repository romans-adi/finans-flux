class MovementsController < ApplicationController
  before_action :set_category, only: %i[index new show create]

  def index
    @user = current_user
    @category = Category.find(params[:category_id])
    @movement = @category.movements.build
    @movements = @category.movements.order(created_at: :desc)
    @total_amount = @category.movements.sum(:amount)
  end

  def show
    @user = current_user
    @category = Category.find(params[:category_id])
    @movement = @category.movements.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @movement = Movement.new
    @categories = Category.where(author_id: current_user.id)
    @category_id = params[:category_id].to_i
  end

  def create
    @category = Category.find(params[:category_id])
    @movement = Movement.new(movement_params)
    @movement.category_id = @category.id
    @movement.user = current_user

    if @movement.save
      redirect_to category_movements_path(@category), notice: 'Transaction was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_movement
    @movement = Movement.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def movement_params
    params.require(:movement).permit(:name, :amount, category_ids: [])
  end
end
