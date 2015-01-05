module Validation
  require "rules/is_integer"
  require "rules/is_boolean"
  require "rules/is_string"
  require "rules/is_positive"
  require "rules/is_email"

  class << self

    def validate(input)
      option = set_values(input)
      load_module(option[:rule])
      is_valid?(option[:input])
    end

    def validate!(input)
      option = set_values(input)
      load_module(option[:rule])
      result = is_valid?(option[:input])

      if result == false
        raise TypeError, "The input #{option[:input]} does not match the rule #{option[:rule]}"
      else
        result
      end
    end

    private
      def set_values(input)
        { rule: input.keys.first.to_s, input: input.values.first }
      end

      def load_module(name)
        module_name = "Is#{name.capitalize}"
        extend self::Rules::const_get(module_name)
      end
  end
end
