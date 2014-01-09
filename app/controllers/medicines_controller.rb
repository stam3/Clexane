class MedicinesController < ApplicationController
    #before_filter :authorize
    
  # GET /medicines
  # GET /medicines.json
  def index
    #@medicines = Medicine.all
    # @medicines = Medicine.order(:name)
    @medicines = Medicine.where("user_id = ?", current_user.id)
    #print 'session[:user_id]: ' ,session[:user_id]
    result = { "opcode" => 100, "response" => 200, "medicines" =>  @medicines }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: result }
    end
  end

  # GET /medicines/1
  # GET /medicines/1.json
  def show
    @medicine = Medicine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medicine }
    end
  end

  # GET /medicines/new
  # GET /medicines/new.json
  def new
    @medicine = Medicine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medicine }
    end
  end

  # GET /medicines/1/edit
  def edit
    @medicine = Medicine.find(params[:id])
  end

  # POST /medicines
  # POST /medicines.json
  def create
    #params[:medicine][:user_id] = session[:user_id]
    print 'in medicines/create, session[:user_id]: ' ,session[:user_id]

    # debugger
    if (params[:medicine])
      @medicine = Medicine.new(params[:medicine])
    else
      # debugger
      @medicine = Medicine.new(:name => params[:name], :specificDays => params[:specificDays], 
                               :canceledNotificationDate => params[:canceledNotificationDate], 
                               :daysOffset => params[:daysOffset],
                                :isSpecificDays => params[:isSpecificDays], :secondHour => params[:secondHour],
                                :daysOffsetStartDate => params[:daysOffsetStartDate], :firstHour => params[:firstHour])
    end

    @medicine.user_id = current_user.id
    respond_to do |format|
      if @medicine.save
        result = { "opcode" => 101, "response" => 200, "medicine" => @medicine }
      
        format.html { redirect_to @medicine, notice: 'Medicine was successfully created.' }
        format.json { render json: result, status: :created, location: result }
        #format.json { render json: @medicine, status: :created, location: @medicine }
      else
        format.html { render action: "new" }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
    # @medicine = Medicine.new(params[:medicine])

    # @medicine.user_id = session[:user_id]

    # respond_to do |format|
    #   if @medicine.save
    #     format.html { redirect_to @medicine, notice: 'Medicine was successfully created.' }
    #     format.json { render json: @medicine, status: :created, location: @medicine }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @medicine.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /medicines/1
  # PUT /medicines/1.json
  def update
    @medicine = Medicine.find(params[:id])
    debugger
    respond_to do |format|
      if (params[:medicine])
        medicine = params[:medicine]
      else
      # debugger
        medicine = {:name => params[:name], :specificDays => params[:specificDays], 
                               :canceledNotificationDate => params[:canceledNotificationDate], 
                               :daysOffset => params[:daysOffset],
                                :isSpecificDays => params[:isSpecificDays], :secondHour => params[:secondHour],
                                :daysOffsetStartDate => params[:daysOffsetStartDate], 
                                :firstHour => params[:firstHour]}
      end
      if @medicine.update_attributes(medicine)#params[:medicine])
        result = { "opcode" => 102, "response" => 200, "medicine" => @medicine }
        format.html { redirect_to @medicine, notice: 'Medicine was successfully updated.' }
        format.json { render json: result, status: :created, location: result }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicines/1
  # DELETE /medicines/1.json
  def destroy
    @medicine = Medicine.find(params[:id])
    if @medicine.user_id == current_user.id
      @medicine.destroy

      respond_to do |format|
        format.html { redirect_to medicines_url }
        result = { "opcode" => 105, "response" => 200 }
        format.json { render json: result }
      end
    else
      respond_to do |format|
        result = { "opcode" => 105, "response" => 401, "error_msg" =>  "Unauthorized" }
        format.html { redirect_to login_url, notice: "Logged out" }
        format.json { render json: result }
      end
    end

  end
end
