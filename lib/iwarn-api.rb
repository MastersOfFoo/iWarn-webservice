# Standard libraries
require "open-uri"

# Gems libraries
require "nancy/base"
require "sequel"
require "rack/protection"
require "rack/contrib"
require "yajl"
require "aws/s3"
require "moonshado-sms"

$LOAD_PATH.unshift(File.dirname(__FILE__))

# Main app
require "iwarn-api/app"
require "iwarn-api/config"

# Models
require "iwarn-api/models/alert"
require "iwarn-api/models/event"
require "iwarn-api/models/photo"
require "iwarn-api/models/person"
require "iwarn-api/models/vehicle"
require "iwarn-api/models/event_log"
require "iwarn-api/models/service"

# Controllers
require "iwarn-api/controllers/alerts_controller"
require "iwarn-api/controllers/events_controller"
require "iwarn-api/controllers/photos_controller"
require "iwarn-api/controllers/people_controller"
require "iwarn-api/controllers/vehicles_controller"
require "iwarn-api/controllers/services_controller"
require "iwarn-api/controllers/event_logs_controller"


# Serializers
require "iwarn-api/serializers/event_serializer"
require "iwarn-api/serializers/photo_serializer"
require "iwarn-api/serializers/alert_serializer"
require "iwarn-api/serializers/array_serializer"

# Uploaders
require "iwarn-api/uploaders/photo_uploader"

# Services
require "iwarn-api/services/sms_service"
require "iwarn-api/services/reverse_geocoding_service"
