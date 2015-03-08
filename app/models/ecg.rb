class Ecg < ActiveRecord::Base
  attr_accessible :user_id, :value
  after_save {|ecg| ecg.message 'my_create' }
  after_update {|ecg| ecg.message 'update' }
  after_destroy {|ecg| ecg.message 'destroy' }

  def message action
    msg = { user_id: self.user_id,
            value:   self.value }
    $redis.select 15
    $redis.sadd(self.user_id, self.value)
    $redis.publish 'rt_ecg', msg.to_json
  end

end
