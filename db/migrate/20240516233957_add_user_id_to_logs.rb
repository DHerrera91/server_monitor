class AddUserIdToLogs < ActiveRecord::Migration[7.1]
    def change
        add_reference :logs, :users, foreign_key: true
    end
end
