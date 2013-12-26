class PicklinesController < ApplicationController

  # GET /picklines
  # GET /picklines.json
  def index
    #@picklines = Pickline.all
    @picklines = Pickline.where("user_id = ?", session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @picklines }
    end
  end

  # GET /picklines/1
  # GET /picklines/1.json
  def show
    @pickline = Pickline.find(params[:id])
    result = { "opcode" => 200, "response" => 200, "pickline" =>  @pickline }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: result }
    end
  end

  # GET /picklines/new
  # GET /picklines/new.json
  def new
    @pickline = Pickline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pickline }
    end
  end

  # GET /picklines/1/edit
  def edit
    @pickline = Pickline.find(params[:id])
  end

  # POST /picklines
  # POST /picklines.json
  def create
    @pickline = Pickline.new(params[:pickline])

    respond_to do |format|
      if @pickline.save
        format.html { redirect_to @pickline, notice: 'Pickline was successfully created.' }
        format.json { render json: @pickline, status: :created, location: @pickline }
      else
        format.html { render action: "new" }
        format.json { render json: @pickline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /picklines/1
  # PUT /picklines/1.json
  def update
    @pickline = Pickline.find_by_id_and_user_id(params[:id], current_user.id)
    if @pickline
      puts 'pickline update - after authorization check'

      if (params[:pickline])
          pickline = params[:pickline]
      else
      # debugger
        pickline = {:blue_last_wash_date => params[:blue_last_wash_date], :red_last_wash_date => params[:red_last_wash_date], 
                               :bandage_replacement_date => params[:bandage_replacement_date], 
                               :bandage_interval_days => params[:bandage_interval_days],
                                :blue_ventile_replacement_date => params[:blue_ventile_replacement_date],
                                :red_ventile_replacement_date => params[:red_ventile_replacement_date],
                                :parpar_replacement_date => params[:parpar_replacement_date] }
      end
      respond_to do |format|
        if @pickline.update_attributes(pickline)
          result = { "opcode" => 201, "response" => 200, "pickline" =>  @pickline }
          format.html { redirect_to @pickline, notice: 'Pickline was successfully updated.' }
          format.json { render json: result }
        else
          format.html { render action: "edit" }
          format.json { render json: @pickline.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        result = { "opcode" => 201, "response" => 401, "error_msg" =>  "Unauthorized" }
        format.html { render action: "edit" }
        format.json { render json: result }
      end
    end
  end

  # DELETE /picklines/1
  # DELETE /picklines/1.json
  def destroy
    @pickline = Pickline.find(params[:id])
    @pickline.destroy

    respond_to do |format|
      format.html { redirect_to picklines_url }
      format.json { head :no_content }
    end
  end

end
