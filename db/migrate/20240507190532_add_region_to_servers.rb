class AddRegionToServers < ActiveRecord::Migration[7.1]
  def change
    add_column :servers, :region, :string
  end
end
