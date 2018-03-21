class ProductsController < ApplicationController
  def index
    @products = Product.search_by_name(params[:search]).paginate(page: params[:page], per_page: Settings.product.pag_max)
  end

  def show
    @products = Product.find_by id: params[:id]
    return if @products
    flash[:danger] = t("products.show.mess")
    redirect_to root_url
  end

  def product_params
    params.require(:product).permit :name, :size, :price, :description, :category_id, :image
  end
end
