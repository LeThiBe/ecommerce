class UsersController < ApplicationController
  before_action :load_user, except: %i(new create)

  def show
    @user || render(file: "public/404.html", status: 404, layout: true)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".info"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t ".updated"
      redirect_to user_path
    else
      render :edit
    end
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "cant_find_user"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :phone, :address
  end
end
