class Log < ApplicationRecord
    belongs_to :user, foreign_key: :users_id
    has_and_belongs_to_many :event_types
end
