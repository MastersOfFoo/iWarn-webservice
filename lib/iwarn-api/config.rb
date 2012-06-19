# Rack environment
RACK_ENV = ENV['RACK_ENV']

# Database
Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/iwarn.sqlite3')

# Amazon S3
S3_KEY = "AKIAJKTZC2AHYR6PIISA"
S3_SECRET = "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"
S3_BUCKET = "iwarn-photos"

# Moonshado SMS
Moonshado::Sms.configure do |config|
  if RACK_ENV == "production"
    config.api_key = ENV['MOONSHADOSMS_URL']
  else
    config.production_environment = false
  end
end

# Google Reverse Geocoding Service
GOOGLE_GEOCODING_URL = "http://maps.googleapis.com/maps/api/geocode/json?sensor=false"
