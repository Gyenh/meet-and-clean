# frozen_string_literal: true

class HomePagesController < ApplicationController
  def index
    @events = Event.all
    @array_date = []

    #debut date
    # on isole la date pour la convertir dans le format: [Mois, Jour]
    @events.each_with_index do |event, i|
      @array_date  <<  @date = Utils.get_date(event.date.to_s)
    end
    #fin date


    # debut mailer

    # @date = Utils.get_date(@event.date.to_s)

    # email = "kyg972@msn.com" # l'émail de l'user
    # name = "Pierre"
    # subject =  MailObject.get_confirmation_subject
    # content = MailObject.get_confirmation_content
    #
    # MailService.send_email(email, name, subject, content) #mail quand inscrit à un event
    #
    # MailService.send_email(email, name, MailObject.get_welcome_subject, subject = MailObject.get_welcome_content) #envoie un mail après que l'user se soit inscrit au site

    # MailService.welcome_email(email)
    # MailService.welcome_email_2(email, name) #envoie un mail après que l'user se soit inscrit au site

    #fin mailer
  end
end
