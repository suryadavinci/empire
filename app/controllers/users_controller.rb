class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find ( params[:id] )
  end

  def create
    @user=User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to EmpireBus!!!"
      redirect_to @user
    else
      flash[:danger] = "What did you do???"

      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
    end
end
