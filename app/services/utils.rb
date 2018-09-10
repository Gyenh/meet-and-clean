  class Utils


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


end
