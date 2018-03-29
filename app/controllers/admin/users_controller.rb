class Admin::UsersController < AdminController
  layout "admin/application"

  def index
    @users = User.paginate page: params[:page], per_page: Settings.user.pag_max
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :phone, :address
  end
end
