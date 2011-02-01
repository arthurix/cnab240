module Cnab240
  class TrailerLote < Base
    def self.processar(linha)
      vlinha = Hash.new
      vlinha["banco"]                              = linha[0..2] #NUMERICO //Código do Banco na Compensação
      vlinha["lote"]                               = linha[3..6] #num - default 0000 //Lote de Serviço
      vlinha["registro"]                           = linha[7..7] #num - default 0 //Tipo de Registro
      vlinha["uso_febraban_cnab"]                  = linha[8..16] #BRANCOS //Uso Exclusivo FEBRABAN / CNAB
      vlinha["qtde_registros"]                     = linha[17..22] #BRANCOS //Uso Exclusivo FEBRABAN / CNAB
      vlinha["simples_qtde_titulos_cobranca"]      = linha[23..28] #num - 1-CPF, 2-CGC //Tipo de Inscrição da Empresa
      vlinha["simples_qtde_titulos_carteiras"]     = linha[29..45] #numerico  //Número de Inscrição da Empresa
      vlinha["caucionada_qtde_titulos_cobranca"]   = linha[46..51] #num - 1-CPF, 2-CGC //Tipo de Inscrição da Empresa
      vlinha["caucionada_qtde_titulos_carteiras"]  = linha[52..68] #numerico  //Número de Inscrição da Empresa
      vlinha["descontada_qtde_titulos_cobranca"]   = linha[69..74] #num - 1-CPF, 2-CGC //Tipo de Inscrição da Empresa
      vlinha["descontada_qtde_titulos_carteiras"]  = linha[75..91] #numerico  //Número de Inscrição da Empresa
      vlinha["uso_febraban_cnab2"]                 = linha[92..122] #brancos //Uso Exclusivo FEBRABAN / CNAB
      vlinha["uso_febraban_cnab3"]                 = linha[123..239] #brancos //Uso Exclusivo FEBRABAN / CNAB
      
      return vlinha
    end
  end
end