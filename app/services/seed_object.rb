#Cette classe contient le contenu du seed
#chaque methode contient un array de string
class SeedObject

  def self.get_mob_name
    mob_name = ['Les mégots', 'Mister Clean', 'Green broom', 'Bin Clean', 'Keep It Clean', 'Make It CLean']
  end

  def self.get_description_event
    description_event = ["Nous allons nous concentrer sur le ramassage de mégot, La définition de déchets est complétée par la notion de déchets ultimes (loi du 13 juillet 1992) : « un déchet résultant ou non d’un traitement d’un déchet, qui n’est plus susceptible d’être traité dans des conditions techniques et économiques du moment, notamment par extraction de la part valorisable ou par réduction de son caractère polluant ou dangereux ».", "Rendons Paris Propre,
      Chaque mois, Mister Clean propose une opération de nettoyage d'un quartier de Paris.
      Leur concept: « Ville propre, Esprit léger »", "Paris croule sous de véritables tonnes de déchets, précise Stéphane Maleuvre, président de la structure. Il y a trois semaines, nous avons repéré la quantité de détritus à ramasser porte de la Chapelle. » Depuis, les bénévoles retournent chaque semaine sur le secteur pour le nettoyer. Samedi, ils ont rempli plus de 100 sacs de 130 litres d’ordures, en seulement quelques heures. « Nous menons des actions de fonds bénéfiques sur le long terme.", "Des opérations de nettoyage approfondi des trottoirs et de la chaussée ont lieu en moyenne deux fois par mois. Lors de ces opérations, les services de la voirie et des espaces verts sont conjointement mobilisés. Une balayeuse, une laveuse, un cantonnier et un agent de maîtrise, accompagnés par la police nationale et municipale, ainsi qu'une dépanneuse sont mobilisés pour redonner un coup de frais aux rues de Vincennes.", "L'agent d'entretien et de nettoyage public enlève les petits déchets tels que papiers, mégots, emballages, sacs en plastique, mais aussi, à la saison, les feuilles mortes et autres déchets végétaux. Il utilise pelles et balais traditionnels et désormais des outils mécaniques : soufflettes pour entasser les feuilles en un seul endroit, caninettes pour ramasser les crottes de chien, appareils de lavage à l’eau sous pression.
", "Un joli balcon, c'est d'abord un balcon propre et sain. N'oubliez donc pas de l'entretenir régulièrement. Ramassez les feuilles mortes. Nettoyez le sol. Si le sol de votre balcon est en ciment ou en béton, oubliez les produits abrasifs ou acides comme la javel, l'ammoniaque ou le vinaigre blanc qui attaqueraient le support. Préférez le bicarbonate de soude ou le savon noir, parfaits aussi pour les sols de balcon en bois."]
    end



    def self.get_event_name  #le nom des évènements...
      ['Les mégots', 'Mister Clean', 'Green broom', 'Bin Clean', 'Keep It Clean', 'Make It CLean']
    end

    def self.get_event_date
      ["2018-09-11", "2018-09-17", "2018-09-29", "2018-09-19", "2018-09-30", "2018-09-27"]

    end
    def self.get_event_hour
      ["2000-01-01 10:00:00 UTC", "2000-01-01 18:30:00 UTC", "2000-01-01 17:30:00 UTC", "2000-01-01 17:30:00 UTC", "2000-01-01 12:30:00 UTC", "2000-01-01 17:00:00 UTC"]
    end

    def self.get_adress
      adress = ['25 Rue du Petit Musc, Paris',  '101 Quai Branly, 75015 Paris', '91 Rue de Rivoli, 75001 Paris', '96 rue de Bercy, 75012 Paris', '39 Rue Pelleport, 75020 Paris', '12 Rue Clément, 75006 Paris']
    end


    def self.get_phone
      phone = %w[0646789465 0764859856 0715326548 0712548568 0710215658 0654213585]
    end

    def self.get_description_mob
      description_mob = ['Nous déployons d’importants moyens humains et matériels pour assurer la propreté de l’espace public.', 'pour rendre nos villes plus propres et plus respirable. Vous êtes toujours les bienvenus dans notre communauté de cleaners  dans le monde entier !', 'Nous sommes une cinquantaine d\'ambassadeurs de la propreté au service de notre ville.', 'Pour éviter la buée sur le miroir, vous prenez tout simplement un savon dur (savon de Marseille par exemple) et vous le frottez sur votre miroir. ', 'Ce n\'est pas parce-que la salle de bain est le temple du savon et de l\'hygiène et que c\'est l\'endroit où on se lave que cette pièce est forcément très propre! ', 'Comment la Hadopi veut muscler le nettoyage du Net']

    end

  end
