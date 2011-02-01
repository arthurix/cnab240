module Cnab240
  class Detalhe < Base
    def self.processar(linha, segmento)
      vlinha = Hash.new

      if segmento == "G"
          #Controle
          vlinha["banco"]                   = linha[0..2] #   Num //Código no Banco da Compensação     
          vlinha["lote"]                    = linha[3..6] #   Num //Lote de Serviço                    
          vlinha["registro"]                = linha[7..7] #   Num  default '3' //Tipo de Registro    
          #Serviço                          
          vlinha["num_registro_lote"]       = linha[8..12] #   Num  //No Sequencial do Registro no Lote  
          vlinha["segmento"]                = linha[13..13] #   Alfa  default 'G' //Código de Segmento no Reg. Detalhe 
          vlinha["complemento_registro"]    = linha[14..14] #   Complemento de registro
          vlinha["cod_movimento"]           = linha[15..16] #   Num  //Codigo de movimento

          vlinha["numero_banco"]            = linha[17..19] #   Num  //Numero do banco na camera de compensação
          vlinha["cod_moeda"]               = linha[20..20] #   R$  //Codigo da moeda no codigo de barras
          vlinha["dig_verificador"]         = linha[21..21] #   Num  //Digito verificador no código de barras
          vlinha["fator_vencimento"]        = linha[22..25] #   Num  //Fator de vencimento
          vlinha["valor_cod_barras"]        = preparaMoeda(linha[26..35], 0..7) #   Float  //Valor impresso no código de barras
          vlinha["campo_cod_barras"]        = linha[36..60] #   Num  //Campo livre no código de barras
          vlinha["cod_inscricao"]           = linha[61..61] #   Num  //Tipo de inscrição do cedente (CPF - CNPJ)
          vlinha["incricao_numero"]         = linha[62..76] #   Num  //Numero de inscrição do cedente
          vlinha["nome_cedente"]            = linha[77..106] #   Nome do cedente
          vlinha["data_venc_titulo"]        = linha[107..114] #   Num  //Data de vencimento do título
          vlinha["valor_nominal"]           = preparaMoeda(linha[115..129], 0..12) #   Float  //Valor nominal do título
          vlinha["quantidade_moeda"]        = preparaMoeda(linha[130..144], 0..9) #   Float  //Quantidade de moeda
          vlinha["cod_moeda"]               = linha[145..146] #   Num  //Codigo da moeda
          vlinha["num_doc_cobranca"]        = linha[147..161] #   Numero do documento de cobrança
          vlinha["ag_cobradora"]            = linha[162..166] #   Num  //Agencia onde o título será cobrado
          vlinha["dig_ag_cobradora"]        = linha[167..167] #   Num  //Digito verificador da agencia cobradora
          vlinha["praca_cobradora"]         = linha[168..177] #   Num  //Praça cobradora
          vlinha["mod_carteira"]            = linha[178..178] #   Num  //Modalidade da carteira
          vlinha["especie_titulo"]          = linha[179..180] #   Num  //Especie do título
          vlinha["data_emissao_titulo"]     = formataData(linha[181..188]) #   Data de emissao do título
          vlinha["juros_de_mora"]           = preparaMoeda(linha[189..203], 0..12) #   Float  //Valor/percentual dos juros de mora por dia de atraso

          vlinha["codigo_1_desconto"]       = linha[204..204] #   Num  //Código do primeiro desconto
          vlinha["data_1_desconto"]         = formataData(linha[205..212]) #   Data limite do primeiro desconto
          vlinha["valor_1_desconto"]        = preparaMoeda(linha[213..227], 0..12) #   Valor/percentual do primeiro desconto a ser concedido

          vlinha["codigo_para_protesto"]    = linha[228..228] #   Num  //Código para protesto
          vlinha["prazo_para_protesto"]     = linha[229..230] #   Num  //Numero de dias para protesto
          vlinha["data_limite"]             = formataData(linha[231..238]) #   Data limite para pagamento do título
          vlinha["codigo_juros"]            = linha[239..239] #   Num  //Código dos juros de mora

      elsif segmento == "H"

          #Controle
          vlinha["banco2"]               = linha[0..2] #   Num //Código no Banco da Compensação     
          vlinha["cod_lote2"]            = linha[3..6] #   Num //Lote de Serviço                    
          vlinha["registro2_detalhe"]    = linha[7..7] #   Num default '3'//Registro detalhe
          #Serviço
          vlinha["num_registro_lote2"]   = linha[8..12] #   Num  //No Sequencial do Registro no Lote  
          vlinha["cod_segmento2"]        = linha[13..13] #   Alfa  default 'H' //Código de Segmento no Reg. Detalhe 
          vlinha["complemento_registro"] = linha[14..14] #   Complemento de registro
          vlinha["cod_movimento2"]       = linha[15..16] #   Num  //Código de movimento
          
          vlinha["cod_insc_sacador"]     = linha[17..17] #   (CPF - CNPJ) Tipo de inscrição do sacador avalista
          vlinha["num_insc_sacador"]     = linha[18..32] #   Numero de inscrição do sacador avalista
          vlinha["nome_sacador"]         = linha[33..72] #   Nome do sacador/avalista
          
          vlinha["cod_2_desconto"]       = linha[73..73] #   Codigo do segundo desconto
          vlinha["data_2_desconto"]      = formataData(linha[74..81]) #   Data limite do segundo desconto
          vlinha["valor_2_desconto"]     = preparaMoeda(linha[82..96], 0..12) #   Valor percentual do segundo desconto a ser concedido
          
          vlinha["cod_3_desconto"]       = linha[97..97] #   Codigo do terceiro desconto
          vlinha["data_3_desconto"]      = formataData(linha[98..105]) #   Data limite do terceiro desconto
          vlinha["valor_3_desconto"]     = preparaMoeda(linha[106..120], 0..12) #   Valor percentual do terceiro desconto a ser concedido
          
          vlinha["cod_multa"]            = linha[121..121] #   Codigo da multa
          vlinha["data_multa"]           = formataData(linha[122..129]) #   Data da multa
          vlinha["valor_multa"]          = preparaMoeda(linha[130..144], 0..12) #   Valor/Percentual da multa a ser aplicada
          vlinha["valor_abatimento"]     = preparaMoeda(linha[145..159], 0..12) #   Valor do abatimento a ser concedido

          vlinha["instrucao_1"]          = linha[160..199] #   instrução 1
          vlinha["instrucao_2"]          = linha[200..239] #   instrução 2
      end

      return vlinha
    end
  end
end