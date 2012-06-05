class Vehicle < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers
  many_to_one :event

  def validate
    validates_presence [:event_id, :identification_number]
  end
end
