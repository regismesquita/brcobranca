module Brcobranca
  module Boleto
    module Template
      module Base
        extend self

        def define_template(template)
          Brcobranca::Boleto::Template.const_get(template.capitalize)
        end
      end
    end
  end
end
