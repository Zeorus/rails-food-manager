class UsersController < ApplicationController
before_action :find_user, only: [:edit, :update]

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

  def edit
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: "Product was successfully updated"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:firs_name, :last_name, :email, :phone_number, :role, :admin)
  end

  def find_user
    @user = User.find(params[:id])
  end
end

