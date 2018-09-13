# frozen_string_literal: true
class HomePagesController < ApplicationController
  def index
    
    @events = Event.all.sort_by &:date
    @array_date = []

    #debut date
    # on isole la date pour la convertir dans le format: [Mois, Jour]
    @events.each_with_index do |event, i|
      @array_date  <<  @date = Utils.get_date(event.date.to_s)
      #on récupère la température via la classe OpenWeather
      OpenWeather.new.get_temperature(event.hour.to_s,  event.date.to_s)
    end
    #fin date

  end
end
