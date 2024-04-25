class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.datetime :log_time
      t.integer :event_type
      t.timestamps
    end
  end
end
