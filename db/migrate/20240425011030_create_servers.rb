class CreateServers < ActiveRecord::Migration[7.1]
  def change
    create_table :servers do |t|
      t.integer :IP
      t.string :name
      t.boolean :Operational_state
      t.timestamps
    end
  end
end
