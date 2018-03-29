class Admin::ProductsController < AdminController
  before_action :load_product, except: %i(index create new)
  before_action :load_all_category, only: %i(new edit show)

  def new
    @products = Product.new
  end

  def create
    @products = Product.new product_params
    if @products.save
      flash[:success] = t ".add_success"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def index
    @products = Product.paginate page: params[:page], per_page: Settings.product.pag_max
    @category = Category.find_by id: params[:category_id]
  end

  def edit; end

  def update
    if @products.update_attributes(product_params)
      flash[:success] = t "updated"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    if @products.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "destroy_fail"
    end
    redirect_to admin_products_path
  end

  private

  def load_product
    @products = Product.find_by id: params[:id]
    return if @products
    flash[:danger] = t "cant_find_product"
    redirect_to root_url
  end

  def load_category
    unless params[:category].nil?
      @category = Category.find_by name: params[:category]
      return if @category
      render file: "public/404.html"
    end
  end

  def product_params
    params.require(:product).permit :name, :size, :price, :quantity, :description, :category_id, :image
  end
end
