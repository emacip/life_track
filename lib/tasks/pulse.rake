require 'rake'
require 'HTTParty'
require 'socket'
require 'pusher'
require 'distribution'

namespace :ECG_pulse do

  desc 'Simulate cardio pulse'

  task :cardio_pulse => :environment do
    run = false
    while run != true do
      puts "Empiezo una nueva!!!"
      arr = [152, 151, 139, 95, 38, 38, 38, 38, 38, 38, 38, 38, 38, 48, 102, 142, 171, 187, 194, 197, 197, 197, 194, 178, 155, 122, 122, 103, 92, 84, 81, 80, 80, 81, 88, 98, 109, 115, 122, 125, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 126, 114, 91, 71, 48, 37, 30, 28, 27, 27, 31, 47, 74, 111, 150, 164, 184, 191, 192, 193, 192, 178, 140, 90, 51, 51, 22, 6, 6, 6, 0, 16, 38, 68, 68, 89, 109, 116, 120, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 120, 114, 101, 80, 63, 48, 38, 32, 31, 30, 30, 30, 30, 32, 48, 73, 104, 129, 129, 164, 173, 177, 178, 178, 178, 156, 113, 78, 52, 37, 27, 22, 21, 21, 24, 39, 63, 83, 104, 113, 119, 119, 121, 122, 122, 122, 122, 121, 121, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 119, 118, 110, 92, 63, 40, 23, 12, 8, 8, 8, 9, 20, 29, 58, 92, 115, 132, 144, 150, 153, 153, 153, 151, 136, 114, 84, 63, 52, 42, 42, 38, 38, 43, 59, 74, 94, 94, 107, 117, 122, 123, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 123, 116, 98, 66, 28, 15, 15, 15, 15, 15, 15, 6, 31, 66, 105, 129, 145, 155, 158, 159, 159, 159, 156, 142, 117, 83, 61, 48, 40, 36, 36, 36, 38, 47, 63, 81, 92, 101, 107, 109]

      HTTParty.get("http://localhost:3000/ecgs/#{2}/new_ecgs",
                   query:{value: arr})
    end
  end


  desc 'test buffer'

  task :test_buffer => :environment do
    run = false
    while run != true do
      puts "Sent new paquets"
      aux =HTTParty.get("http://localhost:3000/ecgs/#{2}/new_ecgs",
                        query:{samples:10,value0:152,value1:151,
                               value2:139,value3:95,
                               value4:38,value5:38,
                               value6:38,value7:38,
                               value8:38,value9:38})
      puts aux.inspect

    end
  end

  desc 'Load buffer'

  task :load_buffer => :environment do
    run = false
    while run != true do
      ecgs = Ecg.limit(50)
      @ecgs =  ecgs.map(&:value)
      msg = @ecgs.each_index {|x| @ecgs[x]}
      puts "push to pusher"
      Pusher.url = "http://4084cadee9c981969e6c:526157f859b607e938d6@api.pusherapp.com/apps/110176"
      Pusher['life_tracking'].trigger('update_life', { message: msg.to_json })
      ecgs.each {|x| x.delete}
      puts "delete"
      sleep(0.001)
    end
  end

  task :start_conexion => :environment do
    Pusher.url = "http://4084cadee9c981969e6c:526157f859b607e938d6@api.pusherapp.com/apps/110176"
    Pusher['life_tracking'].trigger('start_transmission', { message: "Ack0".to_json })
  end

  task :stop_conexion => :environment do
    Pusher.url = "http://4084cadee9c981969e6c:526157f859b607e938d6@api.pusherapp.com/apps/110176"
    Pusher['life_tracking'].trigger('stop_transmission', { message: "Ack5".to_json })
  end

end


