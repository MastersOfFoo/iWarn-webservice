class PhotoSerializer
  def initialize(photo)
    @photo = photo
  end

  def to_json(include_root = false)
    photo_hash = @photo.values
    photo_hash = { 'photo' => photo_hash } if include_root
    Yajl::Encoder.encode(photo_hash)
  end
end
