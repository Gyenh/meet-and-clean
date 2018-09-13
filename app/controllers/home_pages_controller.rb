# frozen_string_literal: true

class HomePagesController < ApplicationController
  def index
    @events = Event.all.sort_by &:date
    @array_date = []
    # Debut date

    # On isole la date pour la convertir dans le format: [Mois, Jour]
    @events.each_with_index do |event, _i|
      # Le undersocre devant le i, signalre que nous allons pas l'utiliser
      @array_date << @date = Utils.get_date(event.date.to_s)
      # on recupere la temperature via la classe OpenWeather
      OpenWeather.new.get_temperature(event.hour.to_s, event.date.to_s)
    end
    # fin date
  end
end
