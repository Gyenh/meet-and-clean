require 'rubygems'
require 'httparty'
class OpenWeather
	include HTTParty

	base_uri "http://api.openweathermap.org/"

	def posts
		self.class.get ('/data/2.5/forecast?q=paris,fr&mode=json&units=metric&lang=fr&appid=8f59043c8a7b69c797c2b9b1338987a2')
	end
	

	def get_temperature(hour, mDate)

		open_weather = OpenWeather.new

		hash = open_weather.posts

		mHour = hour[11..12].to_i

		hash["list"].each_with_index do |mHash, index|

			if mDate ==  mHash["dt_txt"][0..9]

				if mHour <= mHash["dt_txt"][11..12].to_i
					print "la température:  "
					print mHash["main"]["temp"]
					puts "C° "
					puts mHash["weather"][0]["description"]

					return
				end
			end

		end

	end

end
