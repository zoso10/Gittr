module Gittr
  module HashConstructor
    def initialize(args={})
      args.each do |key, value|
        add_instance_variable(key) unless respond_to? "@#{to_snake_case(key)}"
        public_send "#{to_snake_case(key)}=", value
      end
    end

    def to_snake_case(str)
      str.to_s.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end

  protected

    def add_instance_variable(key)
      self.class.class_eval{ attr_accessor key.to_sym }
    end
  end
end
