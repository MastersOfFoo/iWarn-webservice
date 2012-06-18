class Alert < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers
  many_to_one :event
  one_to_one :service

  def validate
    validates_presence [:event_id, :service_id, :message]
  end

  def after_create
    super
    SmsService.new(self.service.number, self.message).deliver
  end
end
