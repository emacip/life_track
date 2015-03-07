class CreateEcgs < ActiveRecord::Migration
  def change
    create_table :ecgs do |t|
      t.float   :value
      t.integer :user_id

      t.timestamps
    end
  end
end
