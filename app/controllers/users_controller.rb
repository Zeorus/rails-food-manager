class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
    @admins = []
    @managers = []
    @riders = []

    @users.each do |user|
      if user.admin?
        @admins << user
      elsif user.role == "manager"
        @managers << user
      else
        @riders << user
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:firs_name, :last_name, :email, :phone_number, :role, :admin)
  end
end

