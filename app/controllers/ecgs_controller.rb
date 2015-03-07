class EcgsController < ApplicationController
  # GET /ecgs
  # GET /ecgs.json
  def index
    @ecgs = Ecg.all

    respond_to do |format|
      format.html { @ecgs = Ecg.all }# show.html.erb
      format.json { render json: @ecgs }
    end
  end

  # GET /ecgs/1
  # GET /ecgs/1.json
  def show
    @ecg = Ecg.find(params[:id])

    respond_to do |format|
      format.html { @ecgs = Ecg.all }# show.html.erb
      format.json { render json: @ecg }
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
        format.json { render json: @ecg, status: :created, location: @ecg }
      else
        format.json { render json: "0"}
      end
    end
  end

end
