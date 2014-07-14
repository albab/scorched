class ZipcodesController < ApplicationController


def index

  result = request.ip
#    if request.location != nil
#      @location = request.location
#      @zipcode = request.zipcode
#    else 
#      @zipcode = "85003"
#    end
  if result == "127.0.0.1"
    @zipcode = "85003"
  else
    @zipcode = result.zipcode
  end

  @ip = result
  w_api = Wunderground.new("1f8d5a20a4815b2f")
  data = w_api.conditions_for(@zipcode)    
  current_temp = data["current_observation"]["temperature_string"]
  current_city = data["current_observation"]["display_location"]["city"]
  current_weather = data["current_observation"]["weather"]
  current_last_refreshed = data["current_observation"]["observation_time"]
  current_wind = data["current_observation"]["wind_string"]
  @temperature = current_temp
  @city = current_city
  @wind = current_wind
  @weather = current_weather    
  @last_updated_at = current_last_refreshed

  @color = "green"
  @feedback = ""
  parsed_temp = current_temp[0..2].to_i

  @test = parsed_temp
  int_test = parsed_temp.to_i
end

end
