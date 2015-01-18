require "gittr/version"

module Gittr

  class << self
    attr_accessor :token

    def configure
      return enum_for(__callee__) unless block_given?
      yield self
    end
  end
end
