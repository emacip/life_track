class Book < ActiveRecord::Base
  attr_accessible :num_pages, :title
  after_create {|book| book.message 'create' }
  after_update {|book| book.message 'update' }
  after_destroy {|book| book.message 'destroy' }
  after_save {|book| book.message 'create' }

  def message action
    msg = { resource: 'books',
            action: action,
            id: self.id,
            obj: self }

    $redis.publish 'rt_ecg', msg.to_json
  end
end
