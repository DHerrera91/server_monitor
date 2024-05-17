class AddRegionIdToServers < ActiveRecord::Migration[7.1]
    def change
        add_reference :servers, :regions, foreign_key: true 
    end
end
