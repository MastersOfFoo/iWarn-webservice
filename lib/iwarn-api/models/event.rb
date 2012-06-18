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

  def after_create
    super
    EventLog.create(log: "Event ##{self.id} registered", event: self)
    google_api = "http://maps.googleapis.com/maps/api/geocode/json?latlng=#{latitude},#{longitude}&sensor=false"  
  end

  def after_update
    super
    EventLog.create(log: "Event ##{self.id} #{self.state}", event: self)
  end
end
