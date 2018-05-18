class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = []
    if session[:cart_id] != nil
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show;  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit; end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new cart_params
    respond_to do |format|
      if @cart.save
        format.html{redirect_to @cart, notice: t(".notice")}
        format.json{render :show, status: :created, location: @cart}
      else
        format.html{render :new}
        format.json{render json: @cart.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update cart_params
        format.html{redirect_to @cart, notice: t(".notice1")}
        format.json{render :show, status: :ok, location: @cart}
      else
        format.html{render :edit}
        format.json{render json: @cart.errors, status: :unprocessable_entity}
      end
    end
  end

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
    redirect_to carts_url
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
