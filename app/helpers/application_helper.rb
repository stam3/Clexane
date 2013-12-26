module ApplicationHelper

	def current_user
		@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	 #  if session[:user_id]
	 #   User.find(session[:user_id]) 
	 #  else
		# nil
	 #  end
	end

	def user_signed_in?
		if (current_user)
		  puts "current_user: #{current_user.email}"
		end
      !!current_user
    end

end

