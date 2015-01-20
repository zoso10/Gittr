module Gittr
  class Organization
    include HashConstructor

    attr_accessor :id, :name, :avatar_url, :room, :premium
  end
end
