module Gittr
  class Repository
    include HashConstructor

    attr_accessor :id, :name, :description, :uri, :private, :exists, :avatar_url, :room

    def room=(room)
      @room = Room.new(room)
    end
  end
end
