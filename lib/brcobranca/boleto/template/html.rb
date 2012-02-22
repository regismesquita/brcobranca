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
          #TODO: Render bank slip
        end

        def modelo_generico_multipage(boletos, options={})
          #TODO: Render multiples bank slips
        end
      end
    end
  end
end
