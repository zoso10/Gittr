require 'httparty'

require 'gittr/version'
require 'gittr/hash_constructor'
require 'gittr/room'
require 'gittr/user'
require 'gittr/channel'
require 'gittr/client'

module Gittr

  class << self
    attr_accessor :token

    def configure
      return enum_for(__callee__) unless block_given?
      yield self
    end
  end
end
