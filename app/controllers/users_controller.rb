class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
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
###############THIS WAS DIFFERENT IN MICHAEL HARTL BOOK################
    @user = current_user
    if @user == nil
      @user = User.find_by(id: session[:user_id])
    end
  end

  def update
###############THIS WAS DIFFERENT IN MICHAEL HARTL BOOK################
    @user = current_user
    if @user.update_attributes( user_params )
      flash[:success] = "Profile Updated"
      redirect_to current_user
    else
      render 'edit'
    end

  end

################IMPLEMENT DESTROY HERE################


  private
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Log in to continue!"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless @user == current_user
    end
end
