module Cnab240
  class HeaderLote < Base
    def self.processar(linha)
      vlinha = Hash.new
      vlinha["banco"]                  = linha[0..2] #NUMERICO //Código do Banco na Compensação
      vlinha["lote"]                   = linha[3..6] #num - default 0000 //Lote de Serviço
      vlinha["registro"]               = linha[7..7] #num - default 0 //Tipo de Registro
      vlinha["operacao"]               = linha[8..8] #BRANCOS //Uso Exclusivo FEBRABAN / CNAB
      vlinha["servico"]                = linha[9..10] #BRANCOS //Uso Exclusivo FEBRABAN / CNAB
      vlinha["uso_febraban_cnab"]      = linha[11..12] #num - 1-CPF, 2-CGC //Tipo de Inscrição da Empresa
      vlinha["layout_lote"]            = linha[13..15] #numerico  //Número de Inscrição da Empresa
      vlinha["uso_febraban_cnab2"]     = linha[16..16] #brancos //Uso Exclusivo FEBRABAN / CNAB
      vlinha["tipo_inscricao"]         = linha[17..17] #alfanumerico  //Código do Convênio no Banco
      vlinha["numero_inscricao"]       = linha[18..32] #alfanumerico  //Código do Convênio no Banco
      vlinha["codigo_cedente"]         = linha[33..38] #alfanumerico  //Código do Convênio no Banco
      vlinha["uso_exclusivo_caixa"]    = linha[39..52] #brancos //Uso Exclusivo CAIXA
      vlinha["ident_agencia"]          = linha[53..57] #numerico //Agência Mantenedora da Conta
      vlinha["ident_dv_agencia"]       = linha[58..58] #alfanumerico //DV da Agência
      vlinha["ident_dv_agencia"]       = linha[58..58] #alfanumerico //DV da Agência
      vlinha["ident_cod_cedente"]      = linha[59..64] #alfanumerico //DV da Agência
      vlinha["cod_modelo"]             = linha[65..71] #alfanumerico //DV da Agência
      vlinha["uso_exclusivo_caixa2"]   = linha[72..72] #brancos //Uso Exclusivo CAIXA
      vlinha["nome_empresa"]           = linha[73..102] #alfanumerico 
      vlinha["nome_banco"]             = linha[102..132] #alfanumerico
      vlinha["mensagem1"]              = linha[103..142] #brancos //Uso Exclusivo FEBRABAN / CNAB
      vlinha["mensagem2"]              = linha[143..182] #brancos //Uso Exclusivo FEBRABAN / CNAB
      vlinha["numero_remessa"]         = linha[183..190] #num - 1-REM E 2-RET ?? //Código do arquivo de remessa/retorno
      vlinha["data_gravacao"]          = formataData(linha[199..206]) #num - formato ddmmaaaa
      vlinha["data_credito"]           = formataData(linha[191..198]) #num - formato ddmmaaaa
      vlinha["uso_febraban_cnab3"]     = linha[207..239] #brancos //Uso Exclusivo FEBRABAN / CNAB
      
      return vlinha
    end
  end
end