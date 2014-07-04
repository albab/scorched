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
    current_wind = data["current_observation"]["wind_string"]
    @temperature = current_temp
    @city = current_city
    @wind = current_wind[0..18]
    @weather = current_weather    
    @last_updated_at = current_last_refreshed
    
    @color = "green"
    @feedback = ""
    parsed_temp = current_temp[0..2].to_i
    
    @test = parsed_temp
    int_test = parsed_temp.to_i
    
    if int_test > 105 
      @feedback = "HEY"
    else 
      @feeback = ""
    end
    
    @test_color = "red"
      
    
    
  end
  
end
