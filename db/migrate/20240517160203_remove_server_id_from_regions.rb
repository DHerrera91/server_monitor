class RemoveServerIdFromRegions < ActiveRecord::Migration[7.1]
    def change
        remove_column :regions, :server_id
    end
end
