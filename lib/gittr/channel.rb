module Gittr
  class Channel
    include HashConstructor

    attr_accessor :id, :name, :topic, :uri, :one_to_one, :unread_items, :mentions, :last_access_time, :lurk, :url, :github_type, :security, :v
  end
end
