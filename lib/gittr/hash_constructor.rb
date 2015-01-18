module Gittr
  module HashConstructor
    def initialize(args={})
      args.each{ |key, value| instance_variable_set("@#{to_snake_case(key)}", value) }
    end

    def to_snake_case(str)
      str.to_s.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
