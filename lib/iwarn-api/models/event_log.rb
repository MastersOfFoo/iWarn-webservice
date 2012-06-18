class EventLog < Sequel::Model
  plugin :timestamps
  many_to_one :event
end
