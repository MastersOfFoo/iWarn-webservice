require "nancy/base"
require "sequel"
require "rack/protection"
require "rack/contrib"
require "micromachine"
require "yajl"

$LOAD_PATH.unshift(File.dirname(__FILE__))

# Main app
require "iwarn-api/app"
require "iwarn-api/config"

# Models
require "iwarn-api/models/event"
require "iwarn-api/models/photo"
require "iwarn-api/models/person"

# Controllers
require "iwarn-api/controllers/events_controller"

# Serializers
require "iwarn-api/serializers/event_serializer"
require "iwarn-api/serializers/array_serializer"
