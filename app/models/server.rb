class Server < ApplicationRecord
    has_and_belongs_to_many :event_types
    belongs_to :region
end
