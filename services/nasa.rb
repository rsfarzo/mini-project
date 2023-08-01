require "http"
require "json"
class NASA
  def self.get_asteroids
    if ENV.has_key? "NASA"
      nasa_api_key = ENV.fetch("NASA")

      url_near_earth = "https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=#{nasa_api_key}"
    
      raw_response = HTTP.get(url_near_earth)

      data = Array.new
      parsed_response = JSON.parse(raw_response)
      number_of_objects = parsed_response["element_count"]
      near_earth_objects =  parsed_response["near_earth_objects"]
   
      near_earth_objects.each { |daily|
        daily[1].each { |object|
          name = object["name"]
          if object["is_potentially_hazardous_asteroid"]
            name += "❗"
          end 
          diameter = (object["estimated_diameter"]["meters"]["estimated_diameter_min"] + object["estimated_diameter"]["meters"]["estimated_diameter_max"]) / 2
          miss_distance = object["close_approach_data"].first["miss_distance"]["miles"].to_i/100000
          data << [ miss_distance, diameter.to_i]
        }
        data = data.sort_by{|k|k[0]}
        @plot_data = data
        pp @plot_data
        #@plot_data = data

      }
    else 
      @plot_data = {'2015-07-20 00:00:00 UTC' => 2, '2015-07-21 00:00:00 UTC' => 4, '2015-07-22 00:00:00 UTC' => 1, '2015-07-23 00:00:00 UTC' => 7}
    end
    if ENV['RACK_ENV'] == 'development'
      #p data
 
      #}
    end
    @plot_data
  end
end
