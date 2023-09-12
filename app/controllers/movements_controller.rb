class MovementsController < ApplicationController
  before_action :set_movement, only: %i[show edit update destroy]

  def index
    @movements = Movement.all
    @categories = Category.all
    @categories = Category.where(author_id: current_user.id)
    @category = Category.find(params[:id])
  end

  def new
    @movement = Movement.new
    @categories = Category.where(author_id: current_user.id) || []
    @category_id = params[:category_id].to_i
  end

  def create
    category_ids = movement_params[:category_ids].reject(&:empty?).map(&:to_i)
    @movement = Movement.new(movement_params.except(:category_ids, :category_id))

    category_ids.each do |id|
      category = Category.find(id)
      category.movements << @movement
    end

    if @movement.save
      redirect_to category_url(movement_params[:category_id]), notice: 'Transaction was successfully created.'
    else
      render :new, status: :unprocessable_movement
    end
  end

  def edit
    @categories = Category.where(author_id: current_user.id) || []
    @category_id = params[:category_id].to_i
  end

  def update
    if @movement.update(movement_params)
      redirect_to movement_url(@movement), notice: 'Movement was successfully updated.'
    else
      render :edit, status: :unprocessable_movement
    end
  end

  def destroy
    @movement.destroy
    redirect_to movements_url, notice: 'Movement was successfully destroyed.'
  end

  private

  def set_movement
    @movement = Movement.find(params[:id])
  end

  def movement_params
    params.require(:movement).permit(:name, :amount, :category_id, category_ids: []).merge(author_id: current_user.id)
  end
end
