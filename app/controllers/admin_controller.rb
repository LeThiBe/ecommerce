class AdminController < ApplicationController
  layout "admin/application"
  before_action :logged_in_user
end
