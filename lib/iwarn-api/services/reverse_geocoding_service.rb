class ReverseGeocodingService
  def initialize(latitude, longitude)
    @latitude, @longitude = latitude, longitude
  end

  def address
    begin
      url = open("#{GOOGLE_GEOCODING_URL}&latlng=#{@latitude},#{@longitude}")
      results = Yajl::Parser.new.parse(url.read)
      return results["results"][0]["formatted_address"]
    rescue
      return ""
    end
  end
end
