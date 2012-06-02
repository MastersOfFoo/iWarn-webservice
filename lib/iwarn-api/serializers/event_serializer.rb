class EventSerializer
  def initialize(event)
    @event = event
  end

  def to_json(include_root = true)
    event_hash = {
      'description' => @event.description,
      'latitude' => @event.latitude,
      'longitude' => @event.longitude,
      'state' => @event.state,
      'type' => @event.type,
      'created_at' => @event.created_at,
      'update_at' => @event.updated_at,
    }
    event_hash = { 'event' => event_hash } if include_root
    Yajl::Encoder.encode(event_hash)
  end
end
