module Validation
  class << self
    def included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      attr_reader :validations

      def validate(name, *params)
        @validations ||= []
        @validations << { name => params }
      end
    end

    module InstanceMethods
      def validate!
        self.class.validations.each do |validation|
          validation.each do |name, params|
            var_name = instance_variable_get("@#{name}")
            send("validate_#{params[0]}_of", var_name, *params[1])
          end
        end
        true
      end

      def valid?
        validate!
      rescue RunTimeError
        false
      end

      private

      def validate_presence_of(name)
        raise 'Отсутствует значение аттрибута' if name.nil? || name.empty?
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
