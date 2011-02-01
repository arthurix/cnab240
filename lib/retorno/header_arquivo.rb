module Cnab240
  class HeaderArquivo < Base
    def self.processar(linha)
      vlinha = Hash.new
      vlinha["banco"]                  = linha[0..2] #NUMERICO //Código do Banco na Compensação
      vlinha["lote"]                   = linha[3..6] #num - default 0000 //Lote de Serviço
      vlinha["registro"]               = linha[7..7] #num - default 0 //Tipo de Registro
      vlinha["cnab1"]                  = linha[8..16] #BRANCOS //Uso Exclusivo FEBRABAN / CNAB
      vlinha["tipo_inscricao_empresa"] = linha[17..17] #num - 1-CPF, 2-CGC //Tipo de Inscrição da Empresa
      vlinha["num_inscricao_empresa"]  = linha[18..31] #numerico  //Número de Inscrição da Empresa
      vlinha["cod_convenio"]           = linha[32..51] #alfanumerico  //Código do Convênio no Banco
      vlinha["agencia"]                = linha[52..56] #numerico //Agência Mantenedora da Conta
      vlinha["dv_agencia"]             = linha[57..57] #alfanumerico //DV da Agência
      vlinha["conta_corrente"]         = linha[58..63] #numerico //Número da Conta Corrente
      vlinha["dv_conta"]               = linha[64..70] #alfanumerico  //DV da Conta Corrent
      vlinha["dv_ag_conta"]            = linha[71..71] #alfanumerico 
      vlinha["nome_empresa"]           = linha[72..101] #alfanumerico 
      vlinha["nome_banco"]             = linha[102..131] #alfanumerico 
      vlinha["uso_febraban_cnab2"]     = linha[132..141] #brancos //Uso Exclusivo FEBRABAN / CNAB
      vlinha["cod_arq"]                = linha[142..142] #num - 1-REM E 2-RET ?? //Código do arquivo de remessa/retorno
      vlinha["data_geracao_arq"]       = formataData(linha[143..150]) #num - formato ddmmaaaa
      vlinha["hora_geracao_arq"]       = linha[151..156] #num - formato hhmmss
      vlinha["sequencia"]              = linha[157..162] #numerico //Número Sequencial do Arquivo
      vlinha["versao_layout_arq"]      = linha[163..165] #num 084 //Num da Versão do Layout do Arquivo
      
      #Complementos do banco
      vlinha["densidade"]              = linha[166..170] #numerico //Densidade de Gravação do Arquivo
      vlinha["reservado_banco"]        = linha[171..190] #alfanumerico //Para Uso Reservado do Banco
      vlinha["reservado_empresa"]      = linha[191..210] #alfanumerico //Para Uso Reservado da Empresa
      vlinha["versao_aplicativo"]      = linha[211..214] #brancos //Uso Exclusivo FEBRABAN / CNAB
      vlinha["uso_febraban_cnab3"]     = linha[215..239] #brancos //Uso Exclusivo FEBRABAN / CNAB
      
      return vlinha
    end
  end
end