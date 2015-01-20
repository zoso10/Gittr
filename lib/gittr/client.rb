module Gittr
  class Client
    include HTTParty

    base_uri 'https://api.gitter.im/v1/'

    def initialize(token=Gittr.token)
      @token = token
      @headers = {"Accept" => "application/json", "Authorization" => "Bearer #{@token}", "Content-Type" => "application/json"}
      raise StandardError.new('API Token is missing') unless @token
    end

    def rooms
      map_get_response('/rooms'){ |room| Room.new(room) }
    end

    def rooms_users(room_id)
      map_get_response("/rooms/#{room_id}/users"){ |user| User.new(user) }
    end

    def rooms_channels(room_id)
      map_get_response("/rooms/#{room_id}/channels"){ |channel| Channel.new(channel) }
    end

    def join_room(uri)
      response = self.class.post('/rooms', headers: @headers, query: {uri: uri})
      Room.new(response.parsed_response)
    end

    def list_messages(room_id, params={})
      map_get_response("/rooms/#{room_id}/chatMessages", params){ |message| Message.new(message) }
    end

    def create_message(room_id, text)
      response = self.class.post("/rooms/#{room_id}/chatMessages", headers: @headers, body: {text: text}.to_json)
      Message.new(response.parsed_response)
    end

    def update_message(room_id, message_id, text)
      response = self.class.put("/rooms/#{room_id}/chatMessages/#{message_id}", headers: @headers, body: {text: text}.to_json)
      Message.new(response.parsed_response)
    end

    def get_user
      # There's only one user in the array, silly...
      get_response("/user"){ |user| User.new(user.first) }
    end

    def user_rooms(user_id)
      map_get_response("/user/#{user_id}/rooms"){ |room| Room.new(room) }
    end

    def mark_as_read(user_id, room_id)
      response = self.class.post("/user/#{user_id}/rooms/#{room_id}/unreadItems", headers: @headers)
      response.parsed_response
    end

    def user_orgs(user_id)
      map_get_response("/user/#{user_id}/orgs"){ |org| Organization.new(org) }
    end

    def user_repos(user_id)
      map_get_response("/user/#{user_id}/repos"){ |repo| Repository.new(repo) }
    end

    def user_channels(user_id)
      map_get_response("/user/#{user_id}/channels"){ |channel| Channel.new(channel) }
    end

  protected

    def get_response(uri, params={}, &block)
      response = self.class.get(uri, headers: @headers, query: params)
      response = response.parsed_response
      return response unless block_given?
      yield response
    end

    def map_get_response(uri, params={}, &block)
      get_response(uri, params).map do |response|
        yield response
      end
    end
  end
end
