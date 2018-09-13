# frozen_string_literal: true

require 'faker'

# Suppression des donnees de chaque tables dans la database
UserEvent.destroy_all
Event.destroy_all
User.destroy_all
Mob.destroy_all
Admin.destroy_all

6.times do |i|
  name = Faker::Name.first_name
  pwd = 123_456

  user = User.create(
    last_name: Faker::Name.last_name,
    first_name: name, email: Faker::Internet.free_email(name),
    password: pwd, password_confirmation: pwd
  )
  mob = Mob.create(
    name: SeedObject.get_mob_name[i],
    phone: SeedObject.get_phone[i],
    web_url_1: Faker::Internet.url,
    web_url_2: Faker::Internet.url,
    description: SeedObject.get_description_mob[i],
    profile_url: 'https://img3.closermag.fr/var/closermag/storage/images/1/2/5/9/1/12591000/hailie-fille-eminem-toujours-sexy-sur-instagram_exact1024x768_l.jpg'
  )

  event = Event.create(
    name: SeedObject.get_event_name[i],
    place: SeedObject.get_adress[i],
    description: SeedObject.get_description_event[i],
    date: SeedObject.get_event_date[i],
    hour: SeedObject.get_event_hour[i],
    mob_id: mob.id,
    banner_url: 'https://img3.closermag.fr/var/closermag/storage/images/1/2/5/9/1/12591000/hailie-fille-eminem-toujours-sexy-sur-instagram_exact1024x768_l.jpg'
  )

  admin = Admin.create(
    email: Faker::Internet.free_email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mob_id: mob.id,
    password: pwd,
    password_confirmation: pwd
  )

  # cette ligne inscrit tous les user a un evenement
  # userEvent = UserEvent.create(user_id: user.id, event_id: event.id)
end

# on ajoute nos mails dans la base de donnee,
# pour se connecter sans etre oblige de s'inscrire
User.first.update(email: 'kyg972@msn.com')
# User.first.second(email: 'ton_adresse@gmail.com')
Admin.first.update(email: 'kyg972@msn.com')
