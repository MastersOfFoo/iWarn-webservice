class Event < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers
  one_to_many :photos
  one_to_many :people
  one_to_many :vehicles
  one_to_many :event_logs
  one_to_many :alerts

  def validate
    validates_presence [:latitude, :longitude, :type, :state]
    validates_includes ["simple", "multiple", "runover"], :type
    validates_includes ["registered", "attended", "closed"], :state
  end

  def before_create
    super
    lat, lng = self.latitude, self.longitude
    if lat && lng
      self.address = ReverseGeocodingService.new(lat, lng).address
    end
  end

  def after_create
    super
    EventLog.create(log: "Event ##{self.id} registered", event: self)
  end

  def after_update
    super
    EventLog.create(log: "Event ##{self.id} #{self.state}", event: self)
  end
end
