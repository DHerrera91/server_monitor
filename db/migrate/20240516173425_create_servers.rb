class CreateServers < ActiveRecord::Migration[7.1]
    def change
        create_table :servers do |t|
            t.string :ip
            t.string :name
            t.string :region
            t.boolean :operational_state
            t.timestamps
        end
    end
end
