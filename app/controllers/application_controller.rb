class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  respond_to :html, :json
  include ApplicationHelper

	protected
	def authorize
		#debugger
		#print 'in ApplicationController, session[:user_id]: ' ,session[:user_id]
		#unless User.find_by_id(session[:user_id])
		puts
		#print 'current_user.id: ', current_user.id
		unless User.find_by_auth_token(cookies[:auth_token])
			puts "unauthorize"
		
			respond_to do |format|
  				format.html { redirect_to login_url, notice: "Please log in" }
  				format.json { render json: {:msg => 'unauthorize request'} }
			end
		end
	end
end
