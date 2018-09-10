#Cette classe contient le contenu du seed
class SeedObject

  def self.get_mob_name
    mob_name = ['Les mégots', 'Mister Clean', 'Green broom']
  end

  def self.get_description_event
    description_event = ["Nous allons nous concentrer sur le rammasage de mégot, La définition de déchet est complétée par la notion de déchet ultime (loi du 13 juillet 1992) : « un déchet résultant ou non d’un traitement d’un déchet, qui n’est plus susceptible d’être traité dans des conditions techniques et économiques du moment, notamment par extraction de la part valorisable ou par réduction de son caractère polluant ou dangereux », et précisée par la circulaire d’avril 1998 « les déchets ultimes sont les déchets dont on a extrait la part récupérable ainsi que les divers éléments polluants comme les piles et accumulateurs ». ", "Rendons Paris Propre
    Chaque mois, Mister Clean propose une opération de nettoyage d'un quartier de Paris.
    Leur concept: « Ville propre, Esprit léger »

    ", "« Paris croule sous de véritables tonnes de déchets, précise Stéphane Maleuvre, président de la structure. Il y a trois semaines, nous avons repéré la quantité de détritus à ramasser porte de la Chapelle. » Depuis, les bénévoles retournent chaque semaine sur le secteur pour le nettoyer. Samedi, ils ont rempli plus de 100 sacs de 130 litres d’ordures, en seulement quelques heures. « Nous menons des actions de fonds bénéfiques sur le long terme, se réjouit Stéphane Maleuvre. Lorsque les bénévoles purifient un endroit, ce lieu ne retrouve généralement pas l’état de saleté qu’il a connu. »"]
  end

  def self.get_confirmation_subject
    'Participation confirmée  !'
  end



def self.get_event_name  #le nom des évènements...
  event_name = ['Les mégots', 'Mister Clean', 'Green broom'] #le nom des évènements...

end


def self.get_adress
  adress = ['91 Rue de Rivoli, 75001 Paris', '101 Quai Branly, 75015 Paris', '96 rue de Bercy, 75012 Paris']

end


def self.get_phone
  phone = %w[0646789465 0764859856 0715326548]
end

def self.get_description_mob
  description_mob = ['Nous déployons d’importants moyens humains et matériels pour assurer la propreté de l’espace public.', 'pour rendre nos villes plus propres et plus respirable. Vous êtes toujours les bienvenus dans notre communauté de cleaners  dans le monde entier !', 'NOus sommes une cinquantaine d\'ambassadeurs de la propreté au service de notre ville.']

end

end
