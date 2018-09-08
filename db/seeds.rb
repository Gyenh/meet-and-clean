# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


UserEvent.destroy_all
Event.destroy_all

User.destroy_all
Mob.destroy_all

mob_name = ['Les mégots', 'Mister Clean', 'Green broom']
phone = %w[0646789465 0764859856 0715326548]
description = ['Nous déployons d’importants moyens humains et matériels pour assurer la propreté de l’espace public.', 'pour rendre nos villes plus propres et plus respirable. Vous êtes toujours les bienvenus dans notre communauté de cleaners  dans le monde entier !', 'NOus sommes une cinquantaine d\'ambassadeurs de la propreté au service de notre ville.']
description_dechet = ['mégots', 'sac plastique', 'déchets']
# userEvent = Test.create( event: '22', user: '65') #testasup

# user2 = User.create! :last_name 'hehe', :first_name => 'John Doe', :email => 'john2@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'

3.times do |i|
  name = Faker::Name.first_name
  pwd = Faker::Internet.password(6)

  user = User.create(last_name: Faker::Name.last_name, first_name: name, email: Faker::Internet.free_email(name), password: pwd, password_confirmation: pwd)

  mob = Mob.create(name: mob_name[i], phone: phone[i], web_url_1: Faker::Internet.url, web_url_2: Faker::Internet.url, description: description[i])

  event = Event.create(name: 'ramass megot', place: "paris #{i + 2} ème", description: "Nous allons nous concentrer sur le rammasage de #{description_dechet[i]}", mob_id: mob.id)

  userEvent = UserEvent.create(user_id: user.id, event_id: event.id)
end

User.first.update(email: 'kyg972@msn.com')
