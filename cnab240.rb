class Cnab240
  
  $HEADER_ARQUIVO = 0
  $HEADER_LOTE = 1
  $DETALHE = 3
  $TRAILER_LOTE = 5
  $TRAILER_ARQUIVO = 9
  
  def self.formataData(dt)
    return DateTime.strptime(dt[0..1]+"/"+dt[2..3]+"/"+dt[4..7], "%d/%m/%Y").strftime('%d/%m/%Y')
  end
  
  def self.preparaMoeda(n)
    return (n[0..12]+"."+n[13..14]).to_f
  end
  
  def self.validaCNAB240(path)
    File.open(path.path, 'rb') { |f|
      while linha = f.gets
        if linha.length != 242 
          return false
        end
      end
    }
    return true
  end
  
  def self.processarHeaderArquivo(linha)
      
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
      vlinha["densidade"]              = linha[166..170] #numerico //Densidade de Gravação do Arquivo
      vlinha["reservado_banco"]        = linha[171..190] #alfanumerico //Para Uso Reservado do Banco
      vlinha["reservado_empresa"]      = linha[191..210] #alfanumerico //Para Uso Reservado da Empresa
      vlinha["versao_aplicativo"]      = linha[211..214] #brancos //Uso Exclusivo FEBRABAN / CNAB
      vlinha["uso_febraban_cnab3"]     = linha[215..239] #brancos //Uso Exclusivo FEBRABAN / CNAB
      
      return vlinha
      
  end
  
  def self.processarHeaderLote(linha)
      
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
  
  
  def self.processarDetalhe(linha, segmento)
      
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
  
  def self.processarTrailerLote(linha)
      
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
  
  def self.processarTrailerArquivo(linha)
      
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
  
  def self.processarLinha(numLn, linha)
      tipoLn = linha[7..7].to_i
      segmento = linha[13..13].to_s
      
      if tipoLn == $HEADER_ARQUIVO
         vlinha = processarHeaderArquivo(linha)
      elsif tipoLn == $HEADER_LOTE 
         vlinha = processarHeaderLote(linha)
      elsif tipoLn == $DETALHE
         vlinha = processarDetalhe(linha, segmento)
      elsif tipoLn == $TRAILER_LOTE
         vlinha = processarTrailerLote(linha)
      elsif tipoLn == $TRAILER_ARQUIVO 
         vlinha = processarTrailerArquivo(linha) 
      end
      return vlinha
  end
  
  def self.processar(args)
    linhas = []
    numLn = 0
    
    File.open(args[:path].path, 'rb') { |f|
      while (linha = f.gets)
        tipoLn = linha[7..7].to_i
        if tipoLn == $HEADER_ARQUIVO and args[:retorna] == $HEADER_ARQUIVO
          linhas << processarHeaderArquivo(linha)
        elsif tipoLn == $DETALHE and args[:retorna] == $DETALHE
          
          segmento = linha[13..13]
          if args[:merge] ==  true
            hash_aux = {}
            
            #RESGATANDO SEGMENTO T PARA AGRUPAMENTO
            segmento = linha[13..13]
            add_to_hash(processarDetalhe(linha, segmento), hash_aux)
            
            #RESGATANDO SEGMENTO U PARA AGRUPAMENTO (PROXIMA LINHA)
            linha = f.gets
            segmento = linha[13..13]
            add_to_hash(processarDetalhe(linha, segmento), hash_aux)
            
            linhas << hash_aux
          else
            linhas << processarDetalhe(linha, segmento)
          end
          
        elsif args[:retorna].blank?
          linhas << processarLinha(numLn, linha)
        end
        numLn += 1
      end
    }
    
    return linhas
    
  end
  
  def self.add_to_hash(my_hash, combined_hash)
    my_hash.inject(combined_hash) do |new_hash, (key, value)|
      (new_hash[key] ||= []) << value
      new_hash
    end
  end

  

  
  
  
end