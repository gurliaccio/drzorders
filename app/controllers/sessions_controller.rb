class SessionsController < ApplicationController
  before_action :redirect_if_signed_in, except: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user_path user
    else
      flash.now[:warning] = "I think you're mistaken. Please try again."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
