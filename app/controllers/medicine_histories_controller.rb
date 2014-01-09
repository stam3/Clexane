class MedicineHistoriesController < ApplicationController
  # GET /medicine_histories
  # GET /medicine_histories.json
  def index
    # @medicine_histories = MedicineHistory.all
    # @medicine_histories = MedicineHistory.joins({:medicine, :user})
    @medicine_histories = current_user.medicine_histories.today

    respond_to do |format|
      result = { "opcode" => 300, "response" => 200, "medicine_histories" => @medicine_histories }
      format.html # index.html.erb
      format.json { render json: result }
    end
  end

  # GET /medicine_histories/1
  # GET /medicine_histories/1.json
  def show
    @medicine_history = MedicineHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medicine_history }
    end
  end

  # GET /medicine_histories/new
  # GET /medicine_histories/new.json
  def new
    @medicine_history = MedicineHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medicine_history }
    end
  end

  # GET /medicine_histories/1/edit
  def edit
    @medicine_history = MedicineHistory.find(params[:id])
  end

  # POST /medicine_histories
  # POST /medicine_histories.json
  def create
    #@medicine_history = MedicineHistory.new(params[:medicine_history])
    @medicine = Medicine.find_by_id_and_user_id(params[:medicine_id], current_user.id)
    if @medicine
      if (params[:medicine_history])
        medicine_history = params[:medicine_history]
      else
      # debugger :, :, :medicineID, :
        medicine_history = {:actualHour => params[:actualHour], :isFirstHour => params[:isFirstHour], 
                               :c_type => params[:c_type] }
      end
      @medicine_history = @medicine.medicine_histories.new(medicine_history)
      #@order = @customer.orders.create(order_date: Time.now)

      respond_to do |format|
        if @medicine_history.save
          result = { "opcode" => 301, "response" => 200, "medicine_history" => @medicine_history }
          format.html { redirect_to @medicine_history, notice: 'Medicine history was successfully created.' }
          format.json { render json: result, status: :created, location: @medicine_history }
        else
          format.html { render action: "new" }
          format.json { render json: @medicine_history.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        result = { "opcode" => 301, "response" => 401, "error_msg" =>  "Unauthorized" }
        format.html { render action: "new" }
        format.json { render json: result }
      end
    end
  end

  # PUT /medicine_histories/1
  # PUT /medicine_histories/1.json
  def update
    @medicine_history = MedicineHistory.find(params[:id])

    respond_to do |format|
      if @medicine_history.update_attributes(params[:medicine_history])
        format.html { redirect_to @medicine_history, notice: 'Medicine history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medicine_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicine_histories/1
  # DELETE /medicine_histories/1.json
  def destroy
    @medicine_history = MedicineHistory.find(params[:id])
    @medicine = Medicine.find(@medicine_history.medicine_id)
    if @medicine.user_id == current_user.id
      @medicine_history.destroy

      respond_to do |format|
        format.html { redirect_to medicine_histories_url }
        result = { "opcode" => 305, "response" => 200 }
        format.json { render json: result }
      end
    else
      respond_to do |format|
        result = { "opcode" => 305, "response" => 401, "error_msg" =>  "Unauthorized" }
        format.html { redirect_to login_url, notice: "Logged out" }
        format.json { render json: result }
      end
    end
  end
end
