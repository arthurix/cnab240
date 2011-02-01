module Cnab240
  class TrailerArquivo < Base
    def self.processar(linha)
      vlinha = Hash.new
      vlinha["banco"]                  = linha[0..2] #NUMERICO //Código do Banco na Compensação
      vlinha["lote"]                   = linha[3..6] #num - default 0000 //Lote de Serviço
      vlinha["registro"]               = linha[7..7] #num - default 0 //Tipo de Registro
      vlinha["uso_febraban_cnab"]      = linha[8..16] #BRANCOS //Uso Exclusivo FEBRABAN / CNAB
      vlinha["qtde_lotes"]             = linha[17..22] #BRANCOS //Uso Exclusivo FEBRABAN / CNAB
      vlinha["qtde_registros"]         = linha[23..28] #num - 1-CPF, 2-CGC //Tipo de Inscrição da Empresa
      vlinha["uso_febraban_cnab2"]     = linha[29..34] #numerico  //Número de Inscrição da Empresa
      vlinha["uso_febraban_cnab3"]     = linha[35..239] #brancos //Uso Exclusivo FEBRABAN / CNAB
      
      return vlinha
    end
  end
end