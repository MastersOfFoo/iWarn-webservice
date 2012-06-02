class Event < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers

  def validate
    validates_presence [:latitude, :longitude, :type, :state]
    validates_includes ["simple", "multiple", "runover"], :type
  end

  def attend!
    tracer.trigger(:attend)
  end

  def close!
    tracer.trigger(:close)
  end

  def tracer
    @tracer ||= begin
      fsm = MicroMachine.new(self.state || "registered")

      fsm.when(:attend, "registered" => "attended")
      fsm.when(:close,  "attended"   => "closed")

      fsm.on(:any) { self.state = tracer.state }

      fsm
    end
  end
end
