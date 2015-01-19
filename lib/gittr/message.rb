module Gittr
  class Message
    include HashConstructor

    attr_accessor :id, :text, :html, :sent, :edited_at, :from_user, :unread, :read_by, :urls, :mentions, :issues, :meta, :v

    def from_user
      User.new(@from_user)
    end
  end
end
