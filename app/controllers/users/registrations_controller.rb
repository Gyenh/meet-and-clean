# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: %i[new create]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @user = current_user.id
    @user_events = UserEvent.find_by(@user)
  end

  # GET /resource/sign_up
  def new # s'exécute avant d'avoir ecris dans la base de donnée
    super
  end

  # POST /resource
  def create # création d'un nouvel user
    # s'exécute avant avoir ecris dans la base de donnée
    super
    # s'exécute apres avoir ecris dans la base de donnée
    begin
      email = current_user.email

      name = 'Marie' # name = current_user.first_name  #je crée un faux nom "Marie" par ce qu'on recupère pas encore le nom de l'user danss  le formulaire d'inscription

      # on appelle la méthode qui sert à envoyer un mail, elle se trouve dans le ficher app/services/mail_object.rb
      MailService.send_email(email, name, MailObject.get_welcome_subject, subject = MailObject.get_welcome_content) # envoie un mail après que l'user se soit inscrit au site
    rescue Exception
      puts 'email error'
    end
  end

  # GET /resource/edit
  def edit
    @user_events = UserEvent.where(user_id: current_user.id)
    super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end
  def show


  end
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
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
