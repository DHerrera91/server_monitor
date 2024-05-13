class AlterLogs < ActiveRecord::Migration[7.1]
  def change
    #Remove unncessary columns
    remove_column :logs, :event_type
    remove_column :logs, :log_time

    #Add columns
    add_column :logs, :url, :string
    add_column :logs, :path, :string
    add_column :logs, :request_method, :string
    add_column :logs, :status, :integer
    add_column :logs, :user_id, :integer
    add_column :logs, :time_spent, :float
    add_column :logs, :user_agent, :text
    add_column :logs, :ip, :string
    add_column :logs, :http_host, :string
    add_column :logs, :error_type, :string
    add_column :logs, :error_message, :text
  end
end
