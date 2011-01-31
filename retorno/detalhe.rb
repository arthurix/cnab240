module Cnab240
  class Detalhe < Base
    def self.processar(linha, segmento)
      vlinha = Hash.new

      if segmento == "T"
          #Controle
          vlinha["banco"]               = linha[0..2] #   Num //Código no Banco da Compensação     
          vlinha["lote"]                = linha[3..6] #   Num //Lote de Serviço                    
          vlinha["registro"]            = linha[7..7] #   Num  default '3' //Tipo de Registro    
          #Serviço
          vlinha["num_registro_lote"]   = linha[8..12] #   Num  //No Sequencial do Registro no Lote  
          vlinha["segmento"]            = linha[13..13] #   Alfa  default 'J' //Código de Segmento no Reg. Detalhe 
          vlinha["uso_exclusivo_cnab"]  = linha[14..14] #   Num //Tipo de Movimento 
          vlinha["cod_movimento"]       = linha[15..16] #   Num  //Código da Instrução p/ Movimento

          vlinha["agencia_conta"]           = linha[17..21] #   Num  //Código da Instrução p/ Movimento   
          vlinha["digito_agencia"]          = linha[22..22] #   Num  //Código da Instrução p/ Movimento   
          vlinha["cod_cedente"]             = linha[23..28] #   Num  //Código da Instrução p/ Movimento   
          vlinha["uso_exclusivo"]           = linha[29..31] #   Num  //Código da Instrução p/ Movimento   
          vlinha["numero_banco"]            = linha[32..34] #   Num  //Código da Instrução p/ Movimento   
          vlinha["uso_exclusivo2"]          = linha[35..38] #   Num  //Código da Instrução p/ Movimento
          vlinha["nosso_numero_modalidade"] = linha[39..40] #   Num  //Código da Instrução p/ Movimento
          vlinha["nosso_numero_titulo"]     = linha[41..55] #   Num  //Código da Instrução p/ Movimento
          vlinha["uso_exclusivo_cnab3"]     = linha[56..56] #   Num  //Código da Instrução p/ Movimento
          vlinha["cod_carteira"]            = linha[57..57] #   Num  //Código da Instrução p/ Movimento
          vlinha["numero_documento"]        = linha[58..68] #   Num  //Código da Instrução p/ Movimento
          vlinha["uso_exclusivo3"]          = linha[69..72] #   Num  //Código da Instrução p/ Movimento
          vlinha["data_vencimento"]         = formataData(linha[73..80]) #   Num  //Código da Instrução p/ Movimento
          vlinha["valor_titulo"]            = preparaMoeda(linha[81..95]) #   Num  //Código da Instrução p/ Movimento
          vlinha["cod_banco"]               = linha[96..98] #   Num  //Código da Instrução p/ Movimento
          vlinha["cod_agencia"]             = linha[99..103] #   Num  //Código da Instrução p/ Movimento
          vlinha["dv"]                      = linha[104..104] #   Num  //Código da Instrução p/ Movimento
          vlinha["titulo_empresa"]          = linha[105..129] #   Num  //Código da Instrução p/ Movimento
          vlinha["cod_moeda"]               = linha[130..131] #   Num  //Código da Instrução p/ Movimento
          vlinha["sacado_tipo_inscricao"]   = linha[132..132] #   Num  //Código da Instrução p/ Movimento
          vlinha["sacado_numero_inscricao"] = linha[133..147] #   Num  //Código da Instrução p/ Movimento
          vlinha["sacado_nome"]             = linha[148..187] #   Num  //Código da Instrução p/ Movimento
          vlinha["uso_exclusivo_cnab2"]     = linha[188..197] #   Num  //Código da Instrução p/ Movimento
          vlinha["valor_tarifa"]            = preparaMoeda(linha[198..212]) #   Num  //Código da Instrução p/ Movimento
          vlinha["motivo_ocorrencia"]       = linha[213..222] #   Num  //Código da Instrução p/ Movimento
          vlinha["uso_exclusivo_cnab3"]     = linha[223..239] #   Num  //Código da Instrução p/ Movimento

          vlinha["cod_pedido"]              = linha[41..55].to_i # o codigo do pedido esta no "numero_documento"    

      elsif segmento == "U"

          #Controle
          vlinha["banco2"]               = linha[0..2] #   Num //Código no Banco da Compensação     
          vlinha["lote2"]                = linha[3..6] #   Num //Lote de Serviço                    
          vlinha["registro2"]            = linha[7..7] #   Num  default '3' //Tipo de Registro    
          #Serviço
          vlinha["num_registro_lote2"]   = linha[8..12] #   Num  //No Sequencial do Registro no Lote  
          vlinha["segmento2"]            = linha[13..13] #   Alfa  default 'J' //Código de Segmento no Reg. Detalhe 
          vlinha["uso_exclusivo_cnab2"]  = linha[14..14] #   Num //Tipo de Movimento 
          vlinha["cod_movimento2"]       = linha[15..16] #   Num  //Código da Instrução p/ Movimento

          vlinha["acrescimos"]           = linha[17..31] #   Num
          vlinha["valor_desconto"]       = preparaMoeda(linha[32..46]) #   Alfa          
          vlinha["valor_abatimento"]     = preparaMoeda(linha[47..61]) #   Num  //Data do Vencimento (Nominal)       
          vlinha["valor_iof"]            = preparaMoeda(linha[62..76]) #   Num..2 casas decimais //Valor do Título (Nominal)          
          vlinha["valor_pago"]           = preparaMoeda(linha[77..91]) #   Num..2 casas decimais //Valor do Desconto + Abatimento     
          vlinha["valor_liquido"]        = preparaMoeda(linha[92..106]) #   Num..2 casas decimais //Valor da Mora + Multa              
          vlinha["outras_despesas"]      = linha[107..121] #   Num           
          vlinha["outros_creditos"]      = linha[122..136] #   Num..2 casas decimais
          vlinha["data_ocorrencia"]      = formataData(linha[137..144]) #   Num..5 casas decimais
          vlinha["data_credito"]         = formataData(linha[145..152]) #   Alfa //Num. do Documento Atribuído pela Empresa 
          vlinha["uso_exclusivo"]        = linha[153..156] #   Num  //Código da Instrução p/ Movimento
          vlinha["data_debito"]          = formataData(linha[157..164]) #   Num  //Código da Instrução p/ Movimento
          vlinha["cod_sacado"]           = linha[165..179] #   Num  //Código da Instrução p/ Movimento
          vlinha["uso_exclusivo2"]       = linha[180..209] #   Num  //Código da Instrução p/ Movimento
          vlinha["cod_banco"]            = linha[210..212] #   Num  //Código da Instrução p/ Movimento
          vlinha["nosso_banco"]          = linha[213..232] #   Num  //Código da Instrução p/ Movimento
          vlinha["uso_exclusivo_cnab2"]  = linha[233..239] #   Num  //Código da Instrução p/ Movimento

      end

      return vlinha
    end
  end
end