class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :load_line_item, only: [:update, :destroy]
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit; end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    if @line_item.save
      flash[:success] = t "line_items.create.create_success"
      redirect_to @line_item.cart
    else
      flash[:danger] = t "line_items.create.create_failed"
      redirect_to products_path
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    if @line_item.update line_item_params
      redirect_to carts_path
    else
      flash[:danger] = t "line_items.update_failed"
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    if @line_item.destroy
      flash[:success] = t "line_items.deleted"
    else
      flash[:danger] = t "line_items.delete_failed"
    end
    redirect_to carts_path(@current_cart)
  end

  def load_line_item
    @line_item = LineItem.find_by id: params[:id]
    return if @line_item
    flash[:danger] = t "line_items.not_item"
    redirect_to products_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find_by id: params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:quantity)
  end
end
