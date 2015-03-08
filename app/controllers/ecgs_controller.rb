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
    samples = params[:samples].to_i-1
    Pusher.url = "http://4084cadee9c981969e6c:526157f859b607e938d6@api.pusherapp.com/apps/110176"
    respond_to do |format|
      Pusher['life_tracking'].trigger('start_transmission', {message: "Ack0".to_json})
      (0..samples).each do |x|
        @ecg = Ecg.new()
        @ecg.user_id = params[:ecg_id]
        @ecg.value = params["value#{x}"]
        if @ecg.save
          format.json { render json: "1" }
        else
          Pusher['life_tracking'].trigger('stop_transmission', {message: "Ack5".to_json})
          format.json { render json: "0" }
        end
      end
    end
  end


  def get_ecgs
    ecgs = Ecg.limit(9)
    respond_to do |format|
      if ecgs.empty?
        Pusher.url = "http://4084cadee9c981969e6c:526157f859b607e938d6@api.pusherapp.com/apps/110176"
        Pusher['life_tracking'].trigger('stop_transmission', {message: "Ack5".to_json})
        format.json { render json: "0" }
      else
        @ecgs =  ecgs.map(&:value)
        msg = @ecgs.each_index {|x| @ecgs[x]}
        puts "push to pusher"
        #   Pusher.url = "http://4084cadee9c981969e6c:526157f859b607e938d6@api.pusherapp.com/apps/110176"
        #   Pusher['life_tracking'].trigger('update_life', { message: msg.to_json })
        ecgs.each {|x| x.delete}
        puts "delete ecgs"
        format.json { render json: @ecgs.to_json }
      end
    end
  end

end
