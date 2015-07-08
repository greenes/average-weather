require 'httparty'


class Temp
  
  def self.get_far_average (query)
    @openweather = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{query},us").parsed_response["main"]["temp"]

    @lat = Geocoder.search(query).first.data["geometry"]["location"]["lat"]
    @lng = Geocoder.search(query).first.data["geometry"]["location"]["lng"]

    @dark_sky_key = '2f1ed417a28ca50b9e29c38a6fa726ca'
    @dark_sky = HTTParty.get("https://api.forecast.io/forecast/#{@dark_sky_key}/#{@lat},#{@lng}").parsed_response["currently"]["temperature"]

    @far_openweather = @openweather * 1.8 - 459.67

    @average_temp = (@far_openweather + @dark_sky) / 2
    @average_temp = @average_temp.round(2)
  end


end
