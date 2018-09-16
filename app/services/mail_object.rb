# frozen_string_literal: true

# Cette classe contient le contenu html/css des emails !
class MailObject
  # l'objet de l'email de bienvenue
  def self.get_welcome_subject
    'Bienvenue sur MobMop'
  end

  def self.get_welcome_admin_subject
    'Bienvenue sur MobMop'
  end

  def self.get_confirmation_subject
    'Participation confirmée  !'
  end

  # le contenu de l'email de bienvenue
  def self.get_welcome_content
    '<h3  style="background-color:black;color:white;padding:20px;">Salut, bienvenue sur MobMop !</h3><br />Que la force soit avec toi! <table border="1" cellpadding="0" cellspacing="0" width="100%">
   <tr>
   <td width="260" valign="top">
   <table border="1" cellpadding="0" cellspacing="0" width="100%">
   <tr>
   <td>
   <img src="https://unsplash.com/photos/RkIsyD_AVvc/download?force=true" alt="" width="100%" height="140" style="display: block;"/>

   <img src="images/bin.jpg"  />
   </td>
   </tr>
   <tr>
   <td style="padding: 25px 0 0 0;">
   yaura des images normalement dolor sit amet, consectetur adipiscing elit. In tempus adipiscing felis, sit amet blandit ipsum volutpat sed. Morbi porttitor, eget accumsan dictum, nisi libero ultricies ipsum, in posuere mauris neque at erat.
   </td>
   </tr>
   </table>
   </td>
   <td style="font-size: 0; line-height: 0;" width="20">
   &nbsp;
   </td>
   <td width="260" valign="top">
   <table border="1" cellpadding="0" cellspacing="0" width="100%">
   <tr>
   <td>
   <img src="blue_bin.jpeg" alt="" width="100%" height="140" style="display: block;" />
   <img src="https://unsplash.com/photos/YzSZN3qvHeo/download?force=true" alt="" width="100%" height="140" style="display: block;"  />
   </td>
   </tr>
   <tr>
   <td style="padding: 25px 0 0 0;">
   Ben voila quoi t\'es inscrit, consectetur adipiscing elit. In tempus adipiscing felis, sit amet blandit ipsum volutpat sed. Morbi porttitor, eget accumsan dictum, nisi libero ultricies ipsum, in posuere mauris neque at erat.
   </td>
   </tr>
   </table>
   </td>
   </tr>
   </table>'
  end

  def self.get_welcome_admin_content(name)
      "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head>
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />
  <title>Email structure</title>
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>
</head>
<body style=\"margin: 0; padding: 0;\" bgcolor=\"#eeeeee \">
  <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">
    <tr>
      <td>
        <table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;\">
          <tr>
            <td align=\"center\" bgcolor=\"#70bbd9\" style=\"padding: 40px 0 30px 0;\">
              <img src=\"https://assets.bigcartel.com/product_images/199533731/merci.jpg?auto=format&fit=max&w=1500\" alt=\"Thank You\" width=\"300\" height=\"230\" style=\"display: block;\" />
            </td>
          </tr>
          <tr>
            <td bgcolor=\"#ffffff\" style=\"padding: 40px 30px 40px 30px;\">
              <table border=\"0.1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">
                <tr>
                  <td>
                    Bienvenue sur MobMop, #{name}
                  </td>
                </tr>
                <tr>
                  <td style=\"padding: 20px 0 30px 0;\">
                    Merci d'avoir créé un compte, pour veiller à ce que nos villes soit plus propre, cela nous réjouit grandement.                    </td>


                  </td>
                </tr>
                <tr>
                  <td>
                    Vous pouvez créer des événements, voir combien de gens y participent, obtenir les prévisions météorologique des 5 prochains jours et bien plus
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td bgcolor=\"#ee4c50\" style=\"padding: 30px 30px 30px 30px;\">
                <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">
                  <td width=\"75%\"  style=\"padding: 10px 10px 10px 10px;\">
                    &reg; fait avec amour par MobMop<br/>
                  </td>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
  </html>"
  end

  def self.get_confirmation_content(name, place, date, hour, embed_map)
    "<h3  style=\"background-color:black;color:white;padding:20px;\">Participation confirmée !</h3><br />

    <div      style=\"display: flex;justify-content: center;\">

    <div >

    <h1>Participation confirmée pour
    <a href=\"http://me-go.fr/\">#{name}</a></h1>
    Paris API <br/>
    Inviter un ami <br/>
    Il vous suffit de faire suivre cet e-mail à un ami et lui demander de s\'inscrire à l'évènement.

    <br/>
    #{date} à #{hour},
    <br/>
    #{place}
    <a href=\"https://www.google.com/maps?f=q&hl=en&q=#{place}\">Itinéraire</a></h1>
    </div>
    #{embed_map}
    </div>"
  end
end
