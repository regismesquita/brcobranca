#encoding: utf-8

begin
  require 'rghost_barcode'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'rghost_barcode'
  require 'rghost_barcode'
end

module Brcobranca
  module Boleto
    module Template
      # Templates para usar com HTML
      module Html
        extend self
        include RGhost unless self.include?(RGhost)
        RGhost::Config::GS[:external_encoding] = Brcobranca.configuration.external_encoding

        def generate(boleto, options)
          if boleto.is_a? Array
            modelo_generico_multipage(boleto, options)
          else
            modelo_generico(boleto, options)
          end
        end

        private

        def modelo_generico(boleto, options={})
          barcode = Barby::Code25Interleaved.new(self.codigo_barras)
          imagem_codigo_barras = Base64.encode64(barcode.to_png(:width => 480, :height => 50, :margin => 0))
          options.merge(:locals => {:boleto => boleto, :imagem_codigo_barras => imagem_codigo_barras })
        end

        def modelo_generico_multipage(boletos, options={})
          #TODO: Render multiples bank slips
        end
      end
    end
  end
end
