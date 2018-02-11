module Validation
  class << self
    def included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      attr_reader :validations

      def validate(name, validation, *params)
        @validations ||= []
        @validations << { name: name, validation: validation, params: params }
      end
    end

    module InstanceMethods
      def validate!
        self.class.validations.each do |hash|
          var_value = instance_variable_get("@#{hash[:name]}")
          send("validate_#{hash[:validation]}_of", var_value, *hash[:params])
        end
        true
      end

      def valid?
        validate!
      rescue RunTimeError
        false
      end

      private

      def validate_presence_of(value)
        raise 'Отсутствует значение аттрибута' if value.nil? || value.empty?
      end

      def validate_format_of(name, format)
        raise 'Аттрибут не соответствует заданному формату' unless name =~ format
      end

      def validate_type_of(name, type)
        raise 'Аттрибут не относится к данному классу' unless name.is_a? type
      end
    end
  end
end
