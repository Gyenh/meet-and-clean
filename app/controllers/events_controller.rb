class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:show, :index]
  before_action :verify_if_currentadmin_have_mobid, except: [:show, :index]
  before_action :admin_have_event, only: %i[edit update destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.sort_by &:date
  end

  # GET /events/1
  # GET /events/1.json
  def show
    event = Event.find(params['id']) #on récupère l'évent en question


    @hour = Utils.get_time(event.hour.to_s) #retourne: "Rendez-vous à 14h" par exemple


    #debut de la map
    #début température
    #on récupère la température via la classe OpenWeather, on la stocke dans la variable @temperature
    @temperature =  OpenWeather.new.get_temperature(event.hour.to_s,  event.date.to_s)
    #fin température

    adress = event.place
    name = event.name
    results = Geocoder.search(adress)
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
        puts "map error"
      end
    end
    #fin de la map
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
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

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
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

  # DELETE /events/1
  # DELETE /events/1.json
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
    #convertion de la date!
    @date = Utils.get_date(@event.date.to_s)
  end

  # Methode qui verifie si le current_admin a une asso lié
  def verify_if_currentadmin_have_mobid
    if current_admin.mob_id == nil
      redirect_to root_path
    end
  end

  # Methode qui va verifier si le current_admin a des events lié a son asso
  def admin_have_event
    event_mob_id = Event.find(params["id"]).mob_id
    admin_mob_id = Admin.find(current_admin.id).mob_id
    if event_mob_id != admin_mob_id
      redirect_to root_path
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:name, :place, :description, :date, :hour, :banner)
  end
end
