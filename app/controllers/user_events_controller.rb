# frozen_string_literal: true

class UserEventsController < ApplicationController
  before_action :set_user_event, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :user_participate_or_not_in_event

  def index
    @user_events = UserEvent.all
  end

  def show
    redirect_to "/events/#{UserEvent.find(params['id']).event_id}"
  end

  def new
    @user_event = UserEvent.new
  end

  def edit; end

  def set_event
    @event = Event.find(params[:id])
  end

  def create
    @user_event = UserEvent.new

    @user_event.user_id = current_user.id
    @user_event.event_id = params[:event_id]
    @user_event.save
    # Debut envoie email de confirmation
    begin
      event = Event.find(params[:event_id])
      date = event.date
      hour = event.hour
      name =  event.name
      place = event.place
      # name = current_user.first_name
      # je cree un faux nom "Marie" par ce qu'on recupere pas encore le nom
      # de l'user dans le formulaire d'inscription
      # On appelle la methode qui sert à envoyer un mail,
      # elle se trouve dans le ficher app/services/mail_object.rb
      MailService.send_email(
        current_user.email,
        name,
        MailObject.get_confirmation_subject,
        MailObject.get_confirmation_content(name, place, date, hour)
      )
      # Envoie un mail après que l'user se soit inscrit au site
      # Fin envoie email de confirmation
    rescue Exception
      flash[:alert] = "Oups, petite erreur d'email mais rien de grave"
    end
    flash[:notice] = 'Participation confirmée'
    redirect_to edit_user_registration_path
  end

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

  def destroy
    @user_event.destroy
    respond_to do |format|
      format.html { redirect_to edit_user_registration_path, notice: 'User event was successfully destroyed.' }
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

  def user_participate_or_not_in_event
    if UserEvent.first.nil?
    elsif UserEvent.where(user_id: current_user.id, event_id: params[:event_id]).blank?
    else
      flash[:notice] = 'Tu participes deja !'
      redirect_to edit_user_registration_path
    end
  end
end
