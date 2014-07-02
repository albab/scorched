class IndexController < ApplicationController
  def new
  end
  
  def index
    w_api = Wunderground.new("1f8d5a20a4815b2f")
    data = w_api.conditions_for("85003")    
    current_temp = data["current_observation"]["temperature_string"]
    current_city = data["current_observation"]["display_location"]["city"]
    @forecast = current_temp
    @city = current_city
  end
  
end
