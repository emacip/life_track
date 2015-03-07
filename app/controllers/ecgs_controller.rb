class EcgsController < ApplicationController
  # GET /ecgs
  # GET /ecgs.json
  def index
    @ecgs = Ecg.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ecgs }
    end
  end

  # GET /ecgs/1
  # GET /ecgs/1.json
  def show
    @ecg = Ecg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ecg }
    end
  end

  # GET /ecgs/new
  # GET /ecgs/new.json
  def new
    @ecg = Ecg.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ecg }
    end
  end

  # GET /ecgs/1/edit
  def edit
    @ecg = Ecg.find(params[:id])
  end

  # POST /ecgs
  # POST /ecgs.json
  def create
    @ecg = Ecg.new()
    #add sensor
    @ecg.user_id = params[:user_id]
    @ecg.value = params[:value]
    respond_to do |format|
      if @ecg.save
        format.html { redirect_to @ecg, notice: 'Ecg was successfully created.' }
        format.json { render json: @ecg, status: :created, location: @ecg }
      else
        format.html { render action: "new" }
        format.json { render json: @ecg.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /ecgs/1/new_ecgs
  def my_create
    @ecg = Ecg.new()
    #add sensor
    @ecg.user_id = params[:ecg_id]
    @ecg.value = params[:value]
    respond_to do |format|
      if @ecg.save
        format.html { redirect_to @ecg, notice: 'Ecg was successfully created.' }
        format.json { render json: @ecg, status: :created, location: @ecg }
      else
        format.html { render action: "new" }
        format.json { render json: @ecg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ecgs/1
  # PUT /ecgs/1.json
  def update
    @ecg = Ecg.find(params[:id])

    respond_to do |format|
      if @ecg.update_attributes(params[:ecg])
        format.html { redirect_to @ecg, notice: 'Ecg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ecg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ecgs/1
  # DELETE /ecgs/1.json
  def destroy
    @ecg = Ecg.find(params[:id])
    @ecg.destroy

    respond_to do |format|
      format.html { redirect_to ecgs_url }
      format.json { head :no_content }
    end
  end
end
