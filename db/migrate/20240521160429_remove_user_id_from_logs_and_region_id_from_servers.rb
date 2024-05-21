class RemoveUserIdFromLogsAndRegionIdFromServers < ActiveRecord::Migration[7.1]
    def change
        remove_column :logs, :user_id
        remove_column :servers, :region_id
    end
end
