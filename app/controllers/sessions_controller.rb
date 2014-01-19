class SessionsController < ApplicationController

	skip_before_filter :authorize
	respond_to :html, :json

  def new
  	print 'in SessionsController::new'

  end

# post 'login' => :create
  def create
  	print 'in SessionsController::create'
  	user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      # if params[:remember_me]
         cookies.permanent[:auth_token] = user.auth_token
      # else
      #   cookies[:auth_token] = user.auth_token
      # end
      #session[:user_id] = user.id
      picklineId = Pickline.find_by_user_id(user.id)
      result = { "opcode" => 1, "response" => 200, "user" => user, "picklineId" => picklineId.id}
      # user["opcode"] = 0 # login
      # user["result"] = 0 # succeeded
      respond_to do |format|
      	format.html { redirect_to :controller => 'medicines', :action => 'index' }#redirect_to medicine_url }
      	format.json { render json: result, status: :created, location: result }
      end
    else
      # redirect_to login_url, alert: "Invalid user/password combination"
      result = { "opcode" => 1, "response" => 401, "error_msg" => "Invalid user/password combination" }
      respond_to do |format|
      	format.html { redirect_to login_url,  alert: "Invalid user/password combination"}
      	# format.json { render json: {:msg => 'login failed'} }
      	format.json { render json: result, status: :created, location: result }
      	 
      end
    end
  end

  # delete 'logout' => :destroy
  def destroy
  	cookies.delete(:auth_token)
    session[:user_id] = nil
    respond_to do |format|
    	format.json { render json: {:result => 'logged out'} }
    	format.html { redirect_to login_url, notice: "Logged out" }
	  end
  end

  def test1

    respond_to do |format|
    	format.json { render json: {:msg => 'has this user'} }
	end
  end
end
