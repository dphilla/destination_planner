

class Forecast
  attr_reader :date,
              :high_temp,
              :low_temp,
              :conditions

  def initialize(attrs = {})
    @date =     attrs["date"]["pretty"]
    @high_temp   = attrs["high"]["fahrenheit"]
    @low_temp   = attrs["low"]["fahrenheit"]
    @conditions   = attrs["conditions"]
  end

  def self.filter(zip)
    forecast = WeatherService.new(zip).parsed_json
    forecast.map do |date|
      Forecast.new(date)
    end
  end



end
