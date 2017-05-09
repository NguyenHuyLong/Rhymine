class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "flash.danger.user_not_existed"
      redirect_to root_path
    end
  end
end
