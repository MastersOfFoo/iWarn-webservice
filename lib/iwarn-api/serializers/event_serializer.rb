class EventSerializer
  def initialize(event)
    @event = event
  end

  def to_json(include_root = false)
    event_hash = @event.values
    event_hash = { 'event' => event_hash } if include_root
    Yajl::Encoder.encode(event_hash)
  end
end
