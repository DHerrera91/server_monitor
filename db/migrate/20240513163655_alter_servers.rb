class AlterServers < ActiveRecord::Migration[7.1]
  def change
    rename_column :servers,  :Operational_state, :operational_state
  end
end
