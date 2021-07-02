class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def ban
    @user = User.find(params[:id])
    if @user.access_locked?
      @user.unlock_access!
    else
      @user.lock_access!
    end
    redirect_to users_path, notice: "User access locked: #{@user.access_locked?}"
  end

  def resend_invitation
    @user = User.find(params[:id])
    if @user.created_by_invite? && @user.invitation_accepted? == false
      @user.invite!
      redirect_to users_path, notice: "User re-invited"
    else
      redirect_to users_path, alert: "User is already active"
    end
  end

end