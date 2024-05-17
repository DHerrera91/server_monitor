class CreateEventTypeServers < ActiveRecord::Migration[7.1]
    def change
        create_table :event_type_servers do |t|
            t.integer :event_type_id, null: false
            t.integer :server_id, null: false
            
            t.timestamps
        end
        add_foreign_key :event_type_servers, :event_types
        add_foreign_key :event_type_servers, :servers
    end
end
