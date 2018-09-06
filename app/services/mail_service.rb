#le fichier de configuration de mailjet se trouve dans: config/initializers/mailjet.rb
class MailService

    def self.send_email(user_email, name, subject,content)

          variable = Mailjet::Send.create(messages: [{
              'From'=> {
                'Email'=> ENV['DEFAULT_FROM'],
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
