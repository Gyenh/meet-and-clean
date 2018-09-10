require 'faker'

#on commence par supprimer toutes les données de toute les tables la database
UserEvent.destroy_all
Event.destroy_all
User.destroy_all
Mob.destroy_all
Admin.destroy_all

mob_name = ['Les mégots', 'Mister Clean', 'Green broom'] #le nom des associations..
event_name = ['Les mégots, louvre', 'Mister Clean, C.I.D.J', 'Green broom'] #le nom des évènements...

phone = %w[0646789465 0764859856 0715326548]
description = ['Nous déployons d’importants moyens humains et matériels pour assurer la propreté de l’espace public.', 'pour rendre nos villes plus propres et plus respirable. Vous êtes toujours les bienvenus dans notre communauté de cleaners  dans le monde entier !', 'NOus sommes une cinquantaine d\'ambassadeurs de la propreté au service de notre ville.']
description_dechet = ['mégots', 'sac plastique', 'déchets']
adress = ['91 Rue de Rivoli, 75001 Paris', '101 Quai Branly, 75015 Paris', 'cacabouya']


3.times do |i|
  name = Faker::Name.first_name
  pwd = 123456

  user = User.create(last_name: Faker::Name.last_name, first_name: name, email: Faker::Internet.free_email(name), password: pwd, password_confirmation: pwd)

  mob = Mob.create(name: mob_name[i], phone: phone[i], web_url_1: Faker::Internet.url, web_url_2: Faker::Internet.url, description: description[i])

  event = Event.create(name: event_name[i], place: "#{adress[i]}", description: "Nous allons nous concentrer sur le rammasage de #{description_dechet[i]}", date: "2018-09-24", hour: "2000-01-01 18:30:00 UTC", mob_id: mob.id)
  admin = Admin.create(email: Faker::Internet.free_email , first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, admin: nil, mob_id: mob.id, password: pwd, password_confirmation: pwd)

#cette ligne inscrit tous les user a un evenement
  # userEvent = UserEvent.create(user_id: user.id, event_id: event.id)
end



User.first.update(email: 'kyg972@msn.com')

Admin.first.update(email: 'kyg972@msn.com')
