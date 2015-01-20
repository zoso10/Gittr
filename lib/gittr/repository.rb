module Gittr
  class Repository
    include HashConstructor

    attr_accessor :id, :name, :description, :uri, :private, :exists, :avatar_url
  end
end
