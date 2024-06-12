class EventType < ApplicationRecord
    has_and_belongs_to_many :logs
    has_and_belongs_to_many :servers
end
