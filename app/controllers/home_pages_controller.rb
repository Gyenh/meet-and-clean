# frozen_string_literal: true

class HomePagesController < ApplicationController
  def index
    @events = Event.all
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
  end
end
