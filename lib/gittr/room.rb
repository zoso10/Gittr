module Gittr
  class Room
    include HashConstructor

    attr_accessor :id, :name, :topic, :uri, :one_to_one, :users, :user_count, :unread_items, :mentions, :last_access_time, :lurk, :url, :github_type, :security, :premium, :noindex, :v
  end
end
