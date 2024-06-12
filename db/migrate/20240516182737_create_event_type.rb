class CreateEventType < ActiveRecord::Migration[7.1]
    def change
        create_table :event_types do |t|
            t.integer :server_id
            t.string :action_type
            t.timestamps
        end
    end
end
