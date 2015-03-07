class Ecg < ActiveRecord::Base
  attr_accessible :user_id, :value
  after_save {|ecg| ecg.message 'my_create' }

  def message action
    msg = { resource: 'books',
            action: "create",
            obj: self }

    $redis.select 15
    $redis.sadd(self.user_id, self.value)
    $redis.publish 'rt_ecg', msg.to_json
  end

end
