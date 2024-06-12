class CreateUsers < ActiveRecord::Migration[7.1]
    def change
        create_table :users do |t|
            t.string :email
            t.string :encypted_password
            t.string :first_name
            t.string :last_name
            t.string :reset_password_token
            t.timestamp :reset_password_sent_at
            t.timestamp :remember_created_at
            t.string :jti
            t.timestamps
        end
    end
end
