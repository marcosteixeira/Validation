module Validation
  module Rules
    module IsEmail
      private
        def is_valid?(input)
          input =~ /\A([^@\.]|[^@\.]([^@\s]*)[^@\.])@([^@\s]+\.)+[^@\s]+\z/ ? true : false
        end
    end
  end
end
