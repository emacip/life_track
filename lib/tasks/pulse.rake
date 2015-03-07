require 'rake'
require 'HTTParty'
require 'socket'
namespace :ECG_pulse do

  desc 'Simulate cardio pulse'

  task :cardio_pulse => :environment do
    (1..4).each do
      HTTParty.get("http://localhost:3000/ecgs/#{2}/new_ecgs",
                    query:{value: Faker::Number.between(-10,10)})
    end
  end

end