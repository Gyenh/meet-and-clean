# frozen_string_literal: true

class UserEventsController < ApplicationController
  before_action :set_user_event, only: %i[show edit update destroy]
  before_action :authenticate_user!

  before_action :check_if_user_exist

  # GET /user_events

  # GET /user_events.json
  def index
    @user_events = UserEvent.all
  end

  # GET /user_events/1
  # GET /user_events/1.json
  def show; end

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
    @user_event = UserEvent.new

    @user_event.user_id = current_user.id
    @user_event.event_id = params['format']

    @user_event.save

    # Début envoie email de confirmation

    begin
    puts 'debut create'
    event = Event.find(params['format'])
    date = event.date
    hour = event.hour
    name =  event.name
    place = event.place

    # name = current_user.first_name  #je crée un faux nom "Marie" par ce qu'on recupère pas encore le nom de l'user danss  le formulaire d'inscription
    # On appelle la méthode qui sert à envoyer un mail, elle se trouve dans le ficher app/services/mail_object.rb
    MailService.send_email(current_user.email, name, MailObject.get_confirmation_subject, MailObject.get_confirmation_content(name, place, date, hour))
    # Envoie un mail après que l'user se soit inscrit au site
    # Fin envoie email de confirmation
  rescue Exception
    puts 'email error'
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
      format.html { redirect_to edit_user_registration_url, notice: 'User event was successfully destroyed.' }
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

  def user_event_id
    unless @user_event.user_id == current_user.id
      flash[:notice] = 'Tu n es pas autoriser a modifier cet event'
      redirect_to user_events_path
    end
  end

  def check_if_user_exist
    if UserEvent.first.nil?
    elsif UserEvent.where(user_id: current_user.id, event_id: params['format']).blank?
    else
      redirect_to root_path
    end
  end
end
