class OrderProductsController < ApplicationController
  before_action :logged_in_user, only: %i(new create)
  before_action :load_order, only: %i(show update update_quantity_product)

  def index
    if logged_in?
      @order_products = current_user.order_products.paginate page: params[:page]
    end
  end

  def show
    @order = OrderProduct.find_by id: params[:id]
    @line_items = @order.line_items.all
  end

  def new
    @user = current_user
    @cart = current_cart
    if @cart.line_items.empty?
      flash[:danger] = t ".empty"
      redirect_to "/"
      return
    end
    @order = OrderProduct.new
  end

  def create
    @order = OrderProduct.new order_params
    @order.add_line_items_from_cart(current_cart)
    @order.user = current_user
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      flash[:success] = t ".thank"
      redirect_to "/"
    else
      render :new
    end
  end

  def update
    if @order.cancelled!
      update_quantity_product
      flash[:success] = t ".cancel_order"
    else
      flash[:danger] = t ".cancel_order_error"
    end
    redirect_to order_product_path
  end

  def load_order
    @order = OrderProduct.find_by id: params[:id]
    return if @order
    flash[:danger] = t ".not_found_order"
    redirect_to order_products_path
  end

  def load_product product_id
    @product = Product.find_by id: product_id
    return if @product
    flash[:danger] = t ".not_found_product"
    redirect_to my_orders_path
  end

  def update_quantity_product
    @order.line_items.each do |item|
      load_product item.product_id
      quantity = item.quantity + @product.quantity
      unless @product.update_attributes quantity: quantity
        flash[:danger] = t "update_quantity_errors"
        redirect_to order_products_path
      end
    end
  end

  private

  def order_params
    params.require(:order_product).permit(:name, :email, :address, :phone, :pay_method)
  end
end
