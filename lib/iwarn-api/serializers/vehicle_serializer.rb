class VehicleSerializer
  def initialize(vehicle)
    @vehicle = vehicle
  end

  def to_json(include_root = false)
    vehicle_hash = @vehicle.values
    vehicle_hash = { 'vehicle' => vehicle_hash } if include_root
    Yajl::Encoder.encode(vehicle_hash)
  end
end
