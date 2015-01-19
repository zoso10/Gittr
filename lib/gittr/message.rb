module Gittr
  class Message
    include HashConstructor

    attr_accessor :id, :text, :html, :sent, :edited_at, :from_user, :unread, :read_by, :urls, :mentions, :issues, :meta, :v, :error

    def from_user=(user)
      @from_user = User.new(user)
    end
  end
end
