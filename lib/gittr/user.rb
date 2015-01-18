module Gittr
  class User
    include HashConstructor

    attr_accessor :id, :username, :display_name, :url, :avatar_url_small, :avatar_url_medium, :role
  end
end
