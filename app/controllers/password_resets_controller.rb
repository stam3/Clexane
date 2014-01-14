class PasswordResetsController < ApplicationController

  skip_before_filter :authorize  #, :only => [:new, :create, :is_logged_in]

  def new
  end

  def create
	  user = User.find_by_email(params[:email])
	  user.send_password_reset if user
	  puts 'send_password_reset, redirect to:', root_url
	  redirect_to root_url, :notice => "Email sent with password reset instructions."
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
      puts "Password reset has expired."
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Password has been reset!"
      puts "Password has been reset!"
    else
      render :edit
      puts 'problem in PasswordResetsController'
    end
  end
  
end
