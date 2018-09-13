# frozen_string_literal: true

# classe dediee à l'envoie de mail
# le fichier de configuration de mailjet se trouve dans :
# config/initializers/mailjet.rb
class MailService
  # cette methode envoie un email

  # les 3 parametres de la methode correspondent à l'email du destinataire,
  # son nom, l'objet de son Email
  # et le contenu de son email

  def self.send_email(user_email, name, subject, content)
    variable = Mailjet::Send.create(messages: [{
                                      'From' => {
                                        'Email' => ENV['DEFAULT_FROM'],
                                        # email du expediteur
                                        'Name' => 'Mobmop'
                                      },
                                      'To' => [
                                        {
                                          'Email' => user_email,
                                          'Name' => name
                                        }
                                      ],
                                      'Subject' => subject,
                                      'TextPart' => 'J\'avoue ne pas trop savoir ce à quoi correspond ce champs, ',
                                      'HTMLPart' => content

                                    }])
    p variable.attributes['Messages']
  end
end
