class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts/1
  # GET /carts/1.json
  def show;  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    if @cart.destroy
      session[:cart_id] = nil
      flash[:success] = t("carts.destroy.notice2")
    else
      flash[:danger] = t("carts.destroy.erro")
    end
    redirect_to products_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find_by id: params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.fetch :cart, {}
  end
end
