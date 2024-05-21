class FixTypeFromEncyptedPasswordToEncryptedPassword < ActiveRecord::Migration[7.1]
    def change
        rename_column :users, :encypted_password, :encrypted_password
    end
end
