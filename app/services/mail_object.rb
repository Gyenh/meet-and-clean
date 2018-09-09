#Cette classe contient le contenu html/css des emails !
class MailObject

  def self.get_welcome_subject #l'objet de l'émail de bienvenue
    'Je te souhaite la bienvenue sur notre site web'
  end

  def self.get_welcome_admin_subject
    'Je te souhaite la bienvenue sur notre site web, admin'
  end

  def self.get_confirmation_subject
    'Participation confirmée  !'
  end



def self.get_welcome_content #le contenu de l'émail de bienvenue
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


def self.get_welcome_admin_content
 '<h3  style="background-color:black;color:white;padding:20px;">Salut, bienvenue sur MobMop, admin !</h3><br />Que la force soit avec toi! Admin<table border="1" cellpadding="0" cellspacing="0" width="100%">
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



def self.get_confirmation_content(name, place, date, hour)
  "<h3  style=\"background-color:black;color:white;padding:20px;\">Participation confirmée !</h3><br />

  <div      style=\"display: flex;justify-content: center;\">

  <div >

  <h1>Participation confirmée pour
  <a href=\"http://me-go.fr/\">#{name}</a></h1>
  Paris API <br/>
  Inviter un ami <br/>
  Il vous suffit de faire suivre cet e-mail à un ami et lui demander de s\'inscrire à l'évènement.

  <br/>
  #{date}
  <br/>
   à #{hour}
  <br/>
  #{place}
  <a href=\"https://www.google.com/maps/place/MK2+Biblioth%C3%A8que/@48.832179,2.3735485,17z/data=!4m12!1m6!3m5!1s0x47e67222e1449a79:0x9372475baf9e14!2sMK2+Biblioth%C3%A8que!8m2!3d48.832179!4d2.3757372!3m4!1s0x47e67222e1449a79:0x9372475baf9e14!8m2!3d48.832179!4d2.3757372\">Itinéraire</a></h1>
  </div>

  </div>"


end

end
