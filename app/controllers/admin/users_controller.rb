# class Admin::UsersController < AdminController
class Admin::UsersController < ApplicationController
  layout "admin/application"

  def index
    @users = User.paginate page: params[:page], per_page: Settings.per_page
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :phone, :address
  end
end
