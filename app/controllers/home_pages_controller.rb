class HomePagesController < ApplicationController
  def index
    @events = Event.all
  end
end
