# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: %i[new create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    super
    @mob = Mob.new
  end

  def create
    super

    # envoie email de bienvenue
    begin
      email = current_admin.email
      name = current_admin.first_name

      # on appelle la méthode qui sert à envoyer un mail,
      # elle se trouve dans le ficher app/services/mail_object.rb

      MailService.send_email(
        email, name,
        MailObject.get_welcome_admin_subject,
        MailObject.get_welcome_admin_content(name)
      )
      # envoie un mail après que l'user se soit inscrit au site
    rescue Exception => e
      puts 'email error'
      puts e
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(_resource)
    '/mobs/new'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
