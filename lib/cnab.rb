["formatacao", "base", "retorno", "header_arquivo", "header_lote", "detalhe", "trailer_arquivo", "trailer_lote"].each do |f|
  require File.join(File.dirname(__FILE__), 'retorno', f)
end
