class Admin::AdminBaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_check

  protected

  def admin_check
    unless current_user.admin?
      flash[:error] = "You don't have permission to view this page."
      redirect_to root_path
    end
  end

end