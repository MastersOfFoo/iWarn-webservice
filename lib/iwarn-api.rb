require "nancy/base"
require "sequel"
require "rack/protection"
require "rack/contrib"
require "yajl"
require "aws/s3"

$LOAD_PATH.unshift(File.dirname(__FILE__))

# Main app
require "iwarn-api/app"
require "iwarn-api/config"

# Models
require "iwarn-api/models/event"
require "iwarn-api/models/photo"
require "iwarn-api/models/person"
require "iwarn-api/models/vehicle"

# Controllers
require "iwarn-api/controllers/events_controller"
require "iwarn-api/controllers/photos_controller"
require "iwarn-api/controllers/people_controller"
require "iwarn-api/controllers/vehicles_controller"


# Serializers
require "iwarn-api/serializers/event_serializer"
require "iwarn-api/serializers/photo_serializer"
require "iwarn-api/serializers/array_serializer"

# Uploaders
require "iwarn-api/uploaders/photo_uploader"
