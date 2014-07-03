class IndexController < ApplicationController
  def new
  end
  
  def index
    w_api = Wunderground.new("1f8d5a20a4815b2f")
    data = w_api.conditions_for("85003")    
    current_temp = data["current_observation"]["temperature_string"]
    current_city = data["current_observation"]["display_location"]["city"]
    current_weather = data["current_observation"]["weather"]
    current_last_refreshed = data["current_observation"]["observation_time"]
    @temperature = current_temp
    @city = current_city
    @weather = current_weather    
    @last_updated_at = current_last_refreshed
    
  end
  
end
