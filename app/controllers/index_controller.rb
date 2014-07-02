class IndexController < ApplicationController
  def new
  end
  
  def index
    w_api = Wunderground.new("1f8d5a20a4815b2f")
    expression = w_api.conditions_for("85003")    
    current_temp = expression["current_observation"]["temperature_string"]
    @forecast = current_temp
  end
  
end
