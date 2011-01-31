module Cnab240
  module Formatacao    
    def formataData(dt)
      return DateTime.strptime(dt[0..1]+"/"+dt[2..3]+"/"+dt[4..7], "%d/%m/%Y").strftime('%d/%m/%Y')
    end

    def preparaMoeda(n)
      return (n[0..12]+"."+n[13..14]).to_f
    end
  end
end