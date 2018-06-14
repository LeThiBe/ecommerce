class Admin::OrderProductsController < AdminController
  before_action :load_order, only: %i(show destroy update update_quantity_product)

  def index
    if logged_in?
      @order_products = OrderProduct.paginate page: params[:page]
    end
  end

  def show
    @order = OrderProduct.find_by id: params[:id]
    @line_items = @order.line_items.all
  end

  def load_order
    @order = OrderProduct.find_by id: params[:id]
    return if @order
    flash[:danger] = t "not_found_order"
    redirect_to admin_order_products_path
  end

  def update
    case params[:status]
    when "approved"
      if @order.approved!
        update_quantity_product
        flash[:success] = t ".update_order"
        redirect_to admin_order_product_path
      else
        flash[:danger] = t "update_error"
        redirect_to admin_order_product_path
      end
    when "cancelled"
      if @order.cancelled!
        update_quantity_product
        flash[:success] = t ".update_order"
        redirect_to admin_order_product_path
      else
        flash[:danger] = t "update_error"
        redirect_to admin_order_product_path
      end
    end
  end

  def destroy
    if @order.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    redirect_to admin_order_product_path
  end

  def load_product product_id
    @product = Product.find_by id: product_id
    return if @product
    flash[:danger] = t "not_found_product"
    redirect_to admin_order_products_path
  end

  def update_quantity_product
    @order.line_items.each do |item|
      load_product item.product_id
      quantity = item.quantity + @product.quantity
      unless @product.update_attributes quantity: quantity
        flash[:danger] = t "update_quantity_errors"
        redirect_to admin_order_products_path
      end
    end
  end

  private

  def order_params
    params.require(:order_product).permit(:status)
  end
end
