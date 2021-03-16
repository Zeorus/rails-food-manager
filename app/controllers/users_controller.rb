class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :destroy]

  def index
    @users = policy_scope(User)
    @admins = []
    @managers = []
    @riders = []

    @user = User.new

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

  def create
    raise
    @user = User.new(user_params)
    authorize @user
    if @user.save
      redirect_to users_path, notice: "Member was successfully created"
    else
      render :new
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: "Member was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, notice: "Member was successfully deleted"
  end

  private

  def user_params
    params.require(:user).permit(:firs_name, :last_name, :email, :phone_number, :role, :admin)
  end

  def find_user
    @user = User.find(params[:id])
  end
end

