# frozen_string_literal: true

class UserEventsController < ApplicationController
  before_action :set_user_event, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :current_user_id_present
  # GET /user_events
  # GET /user_events.json
  def index
    @user_events = UserEvent.all
  end

  # GET /user_events/1
  # GET /user_events/1.json
  def show

    u = UserEvent.find(params["id"])
  event = Event.find(u.event_id)

  adress = event.place
  name = event.name
  puts adress
  puts name

  puts "done"



  # adress = "91 Rue de Rivoli, 75001 Paris 3 ème"
  # adress1 = "paris"
  # adress2 = "101 Quai Branly, 75015 Paris"
  # adress3 = "cacabouya" #crash avec fausse adresse....................

  results = Geocoder.search(adress)

  begin
     puts "start"

        lat = results.first.coordinates[0]

        long = results.first.coordinates[1]

          gon.mapLatLong = [lat, long]
          gon.mapName = name

        rescue Exception

         #rescue avec une fausse adresse ou une adresse plus simple
         #ou tester ça dans le formulaire de new event

         adress = "91 Rue de Rivoli, 75001 "


         results = Geocoder.search(adress)

         lat = results.first.coordinates[0]

         long = results.first.coordinates[1]

           gon.mapLatLong = [lat, long]
           gon.mapName = ["<h3>Erreur</h3>"]

       end

 end

  # GET /user_events/new
  def new



    @user_event = UserEvent.new
  end

  # GET /user_events/1/edit
  def edit; end

  def set_event
    @event = Event.find(params[:id])
  end

  # POST /user_events
  # POST /user_events.json
  def create


    #debut debug gino

if UserEvent.first.nil?

elsif UserEvent.where(:user_id => current_user.id, :event_id => params["format"]).blank?

else
       redirect_to root_path
       return
     end

#fin debug gino
    @user_event = UserEvent.new

    @user_event.user_id = current_user.id
    @user_event.event_id = params['format']

    @user_event.save

    # Début envoie email de confirmation



        begin


      name = 'Marie'
      # name = current_user.first_name  #je crée un faux nom "Marie" par ce qu'on recupère pas encore le nom de l'user danss  le formulaire d'inscription
      # On appelle la méthode qui sert à envoyer un mail, elle se trouve dans le ficher app/services/mail_object.rb
      MailService.send_email(current_user.email, name,
                             MailObject.get_confirmation_subject,
                             subject = MailObject.get_confirmation_content)
      # Envoie un mail après que l'user se soit inscrit au site
      # Fin envoie email de confirmation

        rescue Exception
            puts "email error"

        end



    redirect_to @user_event
  end

  # PATCH/PUT /user_events/1
  # PATCH/PUT /user_events/1.json
  def update
    respond_to do |format|
      if @user_event.update(user_event_params)
        format.html { redirect_to @user_event, notice: 'User event was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_event }
      else
        format.html { render :edit }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_events/1
  # DELETE /user_events/1.json
  def destroy
    @user_event.destroy
    respond_to do |format|
      format.html { redirect_to user_events_url, notice: 'User event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_event
    @user_event = UserEvent.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_event_params
    params.require(:user_event).permit(:user_id, :event_id)
  end

  def current_user_id_present
      Event.find(params[:id])
    if UserEvent.exists?(user_id: current_user.id)
      redirect_to root_path
    else
      UserEvent.create
    end
  end
end
