#le fichier de configuration de mailjet se trouve dans: config/initializers/mailjet.rb
class MailService

#cette methode envoie un email

#les 3 parametres de la méthode correspondent à l'émail du destinataire,
 #son nom, l'objet de son Email
 #et le contenu de son émail

    def self.send_email(user_email, name, subject,content)

          variable = Mailjet::Send.create(messages: [{
              'From'=> {
                'Email'=> ENV['DEFAULT_FROM'], #émail du destinateur
                  'Name'=> 'Mobmop'
              },
              'To'=> [
                  {
                      'Email'=> user_email,
                      'Name'=> name
                  }
              ],
              'Subject'=> subject,
              'TextPart'=> 'J\'avoue ne pas trop savoir ce à quoi correspond ce champs, ',
              'HTMLPart'=> content


          }]
          )
          p variable.attributes['Messages']
   end


end
