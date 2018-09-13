# frozen_string_literal: true
#code qui récupère la météo des 5 prochains jours maxi
require 'rubygems'
require 'httparty'
class OpenWeather
  include HTTParty

  base_uri 'http://api.openweathermap.org/'
  def posts
    self.class.get "/data/2.5/forecast?q=paris,fr&mode=json&units=metric&lang=fr&appid=#{ENV['WEATHER_KEY']}"
  end

  def get_temperature(hour, mDate)
    eventDay = mDate[8..9] #la date du jour
    curr_day = Time.now.strftime("%d/%m/%Y %H:%M")[0..1] #la date de l'event

    curr_mounth = mDate[5..6]
    event_mounth = Time.now.strftime("%d/%m/%Y %H:%M")[3..4]

    #on  détermine si l'évenement est passé ou à venir
    if curr_mounth > event_mounth
      return "L'évenement est passé !"
    elsif curr_mounth == event_mounth
      if curr_day > eventDay
        return "L'évenement est passé"
      end
    end

    open_weather = OpenWeather.new

    hash = open_weather.posts

    mHour = hour[11..12].to_i

    #on lit dans l'immense json des previsions meteo des 5 prochains jour que nous
    #fournit l'API open_weather,
    #si on tombe sur la meteo, on arrete de lire dans le json, et on retourne celle-ci
    #sinon, on retourne (meteo non dispo)
    hash['list'].each_with_index do |mHash, _index|
      next unless mDate == mHash['dt_txt'][0..9]

      next unless mHour <= mHash['dt_txt'][11..12].to_i

      mTemperature = mHash['main']['temp_min'].to_s + '° C - ' + mHash['weather'][0]['description'].to_s

      return mTemperature
    end
    "Prévisions météo actuellement non indisponible"
  end
end
