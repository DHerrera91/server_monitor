class CreateLogEventTypes < ActiveRecord::Migration[7.1]
    def change
        create_table :log_event_types do |t|
            t.integer :log_id, null: false
            t.integer :event_type_id, null: false
            t.timestamps
        end
        add_foreign_key :log_event_types, :logs
        add_foreign_key :log_event_types, :event_types
    end
end
