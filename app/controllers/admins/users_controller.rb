class Admins::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.paginate page: params[:page], per_page: Settings.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t "flash.success.delete_user"
    else
      flash[:danger] = t "flash.danger.delete_user"
    end
    redirect_to users_path
  end
end
