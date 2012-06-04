class Photo < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers

  def validate
    validates_presence [:event_id, :url]
  end

  
end
