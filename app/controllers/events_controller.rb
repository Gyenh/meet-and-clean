# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_admin!, except: %i[show index]
  before_action :verify_if_currentadmin_have_mobid, except: %i[show index]
  before_action :admin_have_event, only: %i[edit update destroy]

  def index
    @events = Event.all.sort_by &:date
  end

  def show
    event = Event.find(params['id'])
    # on recupere l'event en question
    @hour = Utils.get_time(event.hour.to_s)
    # retourne: "Rendez-vous a 14h" par exemple
    # debut de la map
    # debut température
    # on recupère la temperature via la classe OpenWeather,
    # on la stocke dans la variable @temperature
    @temperature = OpenWeather.new.get_temperature(event.hour.to_s, event.date.to_s)
    # fin temperature

    adress = event.place
    name = event.name
    results = Geocoder.search(adress)
    @map_link = "https://www.google.com/maps?f=q&hl=en&q=#{adress}"
    begin
      puts 'start'

      lat = results.first.coordinates[0]

      long = results.first.coordinates[1]

      gon.mapLatLong = [lat, long]
      gon.mapName = name
    rescue Exception
      # rescue avec une fausse adresse ou une adresse plus simple
      # ou tester ça dans le formulaire de new event

      begin
        adress = '91 Rue de Rivoli, 75001'

        results = Geocoder.search(adress)

        lat = results.first.coordinates[0]

        long = results.first.coordinates[1]

        gon.mapLatLong = [lat, long]

        gon.mapName = ['<h3>Erreur</h3>']
      rescue Exception
        puts 'map error'
      end
    end
    # fin de la map
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)
    @event.mob_id = current_admin.mob_id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
    # convertion de la date!
    @date = Utils.get_date(@event.date.to_s)
  end

  # Methode qui verifie si le current_admin a une asso liee
  def verify_if_currentadmin_have_mobid
    redirect_to root_path if current_admin.mob_id.nil?
  end

  # Methode qui va verifier si le current_admin a des events lies a son asso
  def admin_have_event
    event_mob_id = Event.find(params['id']).mob_id
    admin_mob_id = Admin.find(current_admin.id).mob_id
    redirect_to root_path if event_mob_id != admin_mob_id
  end

  def event_params
    params.require(:event).permit(:name, :place, :description, :date, :hour, :banner)
  end
end
