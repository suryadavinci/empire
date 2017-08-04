class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        #set current user
        log_in user
        redirect_to user
      else
        flash.now[:danger] = "Invalid User/Password Combination"
        render 'new'
      end
  end

  def destroy
    log_out
    redirect_to root_path
  end


    # private
    #   def user_params
    #     params.require(@user).permit
end
