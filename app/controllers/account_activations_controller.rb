class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      flash[:success] = t ".activated"
    else
      flash[:danger] = t ".unactivated"
    end
    redirect_to root_url
  end
end
