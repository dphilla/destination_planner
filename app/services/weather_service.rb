require 'net/http'

class WeatherService

  def initialize(zip)
    @uri = URI("http://api.wunderground.com/api/#{ENV["wunderground_api_key"]}/forecast10day/q/#{zip}.json")
  end

  def parsed_json
    resp = get_response["forecast"]["simpleforecast"]["forecastday"]
  end

  def get_response
    resp = Net::HTTP.get(@uri)
    JSON.parse(resp, symnolize_headers: true)
  end


end
