module Cnab240
  class Retorno    
    # Tipos de registros
    $HEADER_ARQUIVO = 0
    $HEADER_LOTE = 1
    $DETALHE = 3
    $TRAILER_LOTE = 5
    $TRAILER_ARQUIVO = 9
    
    attr_accessor :linhas
    
    def initialize(args = {})
      @linhas = processar(args) if validaCNAB240(args[:path])
    end

    def validaCNAB240(path)
      File.open(path, 'rb') do |f|
        while linha = f.gets
          return false if linha.length != 242 
        end
      end
      return true
    end

    def processarLinha(numLn, linha)
      tipoLn = linha[7..7].to_i
      segmento = linha[13..13].to_s

      vlinha = case tipoLn
        when $HEADER_ARQUIVO
           HeaderArquivo.processar(linha)
        when $HEADER_LOTE 
           HeaderLote.processar(linha)
        when $DETALHE
           Detalhe.processar(linha, segmento)
        when $TRAILER_LOTE
           TrailerLote.processar(linha)
        when $TRAILER_ARQUIVO 
           TrailerArquivo.processar(linha) 
        end
      return vlinha
    end

    def processar(args)
      linhas = []
      numLn = 0
  
      File.open(args[:path], 'rb') { |f|
        while (linha = f.gets)
          tipoLn = linha[7..7].to_i
          if tipoLn == $HEADER_ARQUIVO and args[:retorna] == $HEADER_ARQUIVO #0
            puts "Processando header"
            linhas << HeaderArquivo.processar(linha)
          elsif tipoLn == $DETALHE and args[:retorna] == $DETALHE #3
            puts "Processando detalhe"
            segmento = linha[13..13]
            if args[:merge] ==  true
              hash_aux = {}
          
              #RESGATANDO SEGMENTO T PARA AGRUPAMENTO
              segmento = linha[13..13]
              add_to_hash(Detalhe.processar(linha, segmento), hash_aux)
          
              #RESGATANDO SEGMENTO U PARA AGRUPAMENTO (PROXIMA LINHA)
              linha = f.gets
              segmento = linha[13..13]
              add_to_hash(Detalhe.processar(linha, segmento), hash_aux)
          
              linhas << hash_aux
            else
              linhas << Detalhe.processar(linha, segmento)
            end
        
          elsif args[:retorna].blank?
            puts "Processando linha..."
            linhas << processarLinha(numLn, linha)
          end
          numLn += 1
        end
      }
  
      return linhas
    end

    def add_to_hash(my_hash, combined_hash)
      my_hash.inject(combined_hash) do |new_hash, (key, value)|
        (new_hash[key] ||= []) << value
        new_hash
      end
    end
    
  end
end