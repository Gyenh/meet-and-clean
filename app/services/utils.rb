# frozen_string_literal: true

class Utils
  # convertie le format initial de la date en format: [mois, année]
  def self.get_date(date)
    jour = date[8] + date[9]

    mois = date[5] + date[6]
    mounth = { '01' => 'JAN',
               '02' => 'FEV',
               '03' => 'MAR',
               '04' => 'AVR',
               '05' => 'MAI',
               '06' => 'JUIN',
               '07' => 'JUIL',
               '08' => 'AOU',
               '09' => 'SEP',
               '10' => 'OCT',
               '11' => 'NOV',
               '12' => 'DEC' }
    array = [mounth[mois], jour]
  end

  # pareil que plus haut mais avec les mois complet
  def self.get_full_date(date)
    jour = date[8] + date[9]

    mois = date[5] + date[6]
    mounth = { '01' => 'Janvier',
               '02' => 'Février',
               '03' => 'Mars',
               '04' => 'Avril',
               '05' => 'Mai',
               '06' => 'Juin',
               '07' => 'Juillet',
               '08' => 'Août',
               '09' => 'Septembre',
               '10' => 'Octobre',
               '11' => 'Novembre',
               '12' => 'Décembre' }
    new_date = "Rendez-vous le #{jour} #{mounth[mois]} "
  end

  def self.get_time(e)
    "Rendez-vous à #{e[11..12]}h#{e[14..15]} "
  end
  def self.get_clean_time(e)
    "#{e[11..12]}h#{e[14..15]}"
  end
end
