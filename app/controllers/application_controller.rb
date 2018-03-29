class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_all_category
  include SessionsHelper
  include ProductsHelper
  include CartsHelper

  def load_all_category
    @categories = Category.includes(:subcategories)
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "users.logged_in_user.pl_login"
      redirect_to new_user_session_path
    end
  end
end
