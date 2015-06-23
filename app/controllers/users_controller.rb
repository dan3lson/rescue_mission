class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User saved successfully."
      redirect_to users_path
    else
      flash[:danger] = "User not saved."
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User edited successfully."
      redirect_to @user
    else
      flash[:danger] = "User not edited."
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User deleted successfully."
      redirect_to users_path
    else
      flash[:danger] = "User not deleted."
      redirect_to user_path(@user)
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
