class AlertSerializer
  def initialize(alert)
    @alert = alert
  end

  def to_json(include_root = false)
    alert_hash = @alert.values
    alert_hash = { 'alert' => alert_hash } if include_root
    Yajl::Encoder.encode(alert_hash)
  end
end
