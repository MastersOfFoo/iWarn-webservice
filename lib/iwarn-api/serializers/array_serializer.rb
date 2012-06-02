class ArraySerializer
  def initialize(array)
    @array = array
  end

  def to_json(include_root = false)
    array = []
    @array.each do |object|
      hash = object.values
      hash = { object.class.to_s.downcase => hash } if include_root
      array << hash
    end
    Yajl::Encoder.encode(array)
  end
end
