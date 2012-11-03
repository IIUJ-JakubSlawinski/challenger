class SessionsController < ApplicationController
  before_filter :ensure_not_signed_in, only: [:new]

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Successfully signed in"
      redirect_back_or user #redirect_back_or in SessionsHelper
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = "Successfully signed out"
    redirect_to root_url
  end

  private

  def ensure_not_signed_in
    if signed_in? #signed_in? in SessionsHelper 
      redirect_to current_user
    end
  end
end
