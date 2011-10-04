# -*- encoding: utf-8 -*-
module Brcobranca
  module Boleto
    class Santander < Base

      validates_length_of :agencia, :maximum => 4, :message => "deve ser menor ou igual a 4 dígitos."
      validates_length_of :convenio, :maximum => 11, :message => "deve ser menor ou igual a 11 dígitos."
      validates_length_of :numero_documento, :maximum => 7, :message => "deve ser menor ou igual a 7 dígitos."

      # Nova instancia do Banespa
      # @param (see Brcobranca::Boleto::Base#initialize)
      def initialize(campos={})
        padrao = {:carteira => "102", :banco => "033"}
        campos = padrao.merge!(campos)
        super(campos)
      end

      # @abstract Deverá ser sobreescrito para cada banco.
      def nosso_numero_boleto
        "#{self.numero_documento}-#{self.nosso_numero_dv}"
      end

      # @abstract Deverá ser sobreescrito para cada banco.
      def agencia_conta_boleto
        "#{self.agencia}-#{self.agencia_dv}/#{self.conta_corrente}-#{self.conta_corrente_dv}"
      end

      # Monta a segunda parte do código de barras, que é específico para cada banco.
      #
      # @abstract Deverá ser sobreescrito para cada banco.
      def codigo_barras_segunda_parte
          "9" * 25
      end

    end
  end
end
