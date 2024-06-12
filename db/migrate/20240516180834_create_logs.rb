class CreateLogs < ActiveRecord::Migration[7.1]
    def change
        create_table :logs do |t|
            t.integer :user_id
            t.integer :event_type_id
            t.string :request_method
            t.integer :status
            t.string :url
            t.string :path
            t.string :user_agent
            t.string :ip
            t.float :time_spent
            t.string :error_type
            t.string :error_message  
            t.timestamps
        end
    end
end
