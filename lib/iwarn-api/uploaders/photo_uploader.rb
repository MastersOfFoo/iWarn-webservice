class PhotoUploader
  attr_reader :url

  def initialize(upload)
    @filename, @tmpfile = upload[:filename], upload[:tempfile]
  end

  def upload!
    AWS::S3::Base.establish_connection!(access_key_id: S3_KEY, secret_access_key: S3_SECRET)
    AWS::S3::S3Object.store(@filename, @tmpfile, S3_BUCKET, content_type: "image/jpg", :access => :public_read)
    @url = "http://#{S3_BUCKET}.s3.amazonaws.com/#{@filename}"
  end
end
