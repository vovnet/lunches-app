class Admin::UsersController < Admin::AdminBaseController
  def index
    @users = User.all
  end
end