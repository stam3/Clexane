class ClexaneHistoriesController < ApplicationController
  # GET /clexane_histories
  # GET /clexane_histories.json
  def index
    #@clexane_histories = ClexaneHistory.all
    @clexane_histories = current_user.clexane_histories #.reorder('shotDate'), 
    #The reorder method overrides the default scope order.

    respond_to do |format|
      format.html # index.html.erb
      result = { "opcode" => 600, "response" => 200, "clexane_histories" => @clexane_histories}
      format.json { render json: result }
    end
  end

  # GET /clexane_histories/1
  # GET /clexane_histories/1.json
  def show
    @clexane_history = ClexaneHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clexane_history }
    end
  end

  # GET /clexane_histories/new
  # GET /clexane_histories/new.json
  def new
    @clexane_history = ClexaneHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clexane_history }
    end
  end

  # GET /clexane_histories/1/edit
  def edit
    @clexane_history = ClexaneHistory.find(params[:id])
  end

  # POST /clexane_histories
  # POST /clexane_histories.json
  def create
    @clexane_history = ClexaneHistory.new(params[:clexane_history])
    @clexane_history.user_id = current_user.id

    respond_to do |format|
      if @clexane_history.save
        format.html { redirect_to @clexane_history, notice: 'Clexane history was successfully created.' }
        result = { "opcode" => 601, "response" => 200, "clexane_history" => @clexane_history}
        format.json { render json: result, status: :created, location: @clexane_history }
      else
        format.html { render action: "new" }
        result = { "opcode" => 601, "response" => 1100, "error_msg" => @clexane_history.errors }
        format.json { render json: result, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clexane_histories/1
  # PUT /clexane_histories/1.json
  def update
    @clexane_history = ClexaneHistory.find(params[:id])

    respond_to do |format|
      if @clexane_history.update_attributes(params[:clexane_history])
        format.html { redirect_to @clexane_history, notice: 'Clexane history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clexane_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clexane_histories/1
  # DELETE /clexane_histories/1.json
  def destroy
    @clexane_history = ClexaneHistory.find(params[:id])
    @clexane_history.destroy

    respond_to do |format|
      format.html { redirect_to clexane_histories_url }
      format.json { head :no_content }
    end
  end
end
