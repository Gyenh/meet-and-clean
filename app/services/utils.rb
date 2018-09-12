class Utils

  #convertie le format initial de la date en format: [mois, année]
  def self.get_date(date)

    jour = date[8] + date[9]

    mois = date[5] + date[6]
    mounth = { "01" => "JAN",
      "02" => "FEV",
      "03" => "MAR",
      "04" => "AVR",
      "05" => "MAI",
      "06" => "JUIN",
      "07" => "JUIL",
      "08" => "AOU",
      "09" => "SEP",
      "10" => "OCT",
      "11" => "NOV",
      "12" => "DEC",

    }
    array = [mounth[mois], jour]
  end



  def self.get_time(e)

    "Rendez-vous à #{e[11..12]}h#{e[14..15]} "
  end

end
