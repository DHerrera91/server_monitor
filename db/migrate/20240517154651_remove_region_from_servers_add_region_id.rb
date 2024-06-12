class RemoveRegionFromServersAddRegionId < ActiveRecord::Migration[7.1]
    def change
        add_column :servers, :region_id, :integer
        remove_column :servers, :region
    end
end
