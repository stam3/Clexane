class UsersController < ApplicationController

  skip_before_filter :authorize, :only => [:new, :create, :is_logged_in]
  # GET /users
  # GET /users.json
  def index
    @users = User.order(:email) #User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  # match '/signup',  :to => 'users#new'
  def new
    puts 'in users#new'
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    if (params[:user])
      @user = User.new(params[:user])
    else
      # debugger
      @user = User.new(:email => params[:email], :password => params[:password], 
                               :password_confirmation => params[:password_confirmation] )
    end
    #print 'in new, user: ' + @user.email
    respond_to do |format|
      if @user.save
        
        # create new pickline
        pickline = Pickline.new(bandage_interval_days: 2, bandage_replacement_date: DateTime.now, blue_last_wash_date: DateTime.now, 
                                blue_ventile_replacement_date: DateTime.now, parpar_replacement_date: DateTime.now, 
                                red_last_wash_date: DateTime.now,red_ventile_replacement_date: DateTime.now, user_id: @user.id )
       
        if pickline.save

          #login
          session[:user_id] = @user.id 
          format.html { redirect_to users_url, notice: 'User was successfully created.' }
          #format.json { redirect_to login_url(params[:user]) }
          result = { "opcode" => 2, "response" => 200, "user" => @user}
          format.json { render json: result, status: :created, location: result }
        else
          #session[:user_id] = nil
          format.html { render action: "new" }
          format.json { render json: pickline.errors, status: :unprocessable_entity }
        end
        #format.json { render json: @user, status: :created, location: @user }
      else
        #session[:user_id] = nil
        format.html { render action: "new" }
        result = { "opcode" => 2, "response" => 1100, "error_msg" => @user.errors }
        format.json { render json: result, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def is_logged_in

    respond_to do |format|
      if User.find_by_id(session[:user_id])
        format.html { render text: "loggedin: " + User.find_by_id(session[:user_id]).email }
        format.json { render json: {:msg => 'loggedin: ' + User.find_by_id(session[:user_id]).email} }
      else
        format.html { render text: "logged out" }
        format.json { render json: {:msg => 'logged out'} }
      end
    end
  end


end
