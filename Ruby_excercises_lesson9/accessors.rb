module Accessors
  class << self
    def included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def attr_accessor_with_history(*name)
        name.each do |name|
          define_method(name) { instance_variable_get("@#{name}") }
          define_method("#{name}_history") { instance_variable_get("@#{name}_history") }
          define_method("#{name}=") do |value|
            instance_variable_set("@#{name}", value)
            history = instance_variable_get("@#{name}_history") || []
            instance_variable_set("@#{name}_history", history << value)
          end
        end
      end

      def strong_attr_accessor(name, class_name)
        define_method(name) { instance_variable_get("@#{name}") }
        define_method("#{name}=") do |value|
          raise 'Неверно указан класс переменной' unless value.is_a? class_name
          instance_variable_set("@#{name}", value)
        end
      end
    end
  end
end
