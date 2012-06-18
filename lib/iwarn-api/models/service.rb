class Service < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers
    
  def validate
    validates_presence [:name, :number]
  end
end
