class OrderProductsController < ApplicationController
  def index
    @orders = OrderProduct.all
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
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html{redirect_to "/", notice: t(".thank")}
        format.json{render :show, status: :created, location: @order}
      else
        format.html{render :new }
        format.json{render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def order_params
    params.require(:order_product).permit(:name, :email, :address, :phone, :pay_method)
  end
end
