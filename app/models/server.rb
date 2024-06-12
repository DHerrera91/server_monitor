class Server < ApplicationRecord
    has_and_belongs_to_many :event_types
    belongs_to :region, foreign_key: "regions_id"
end
