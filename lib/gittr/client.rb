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
      response = self.class.get('/rooms', headers: @headers)
      response.parsed_response.map{ |room| Room.new(room) }
    end

    def rooms_users(room_id)
      response = self.class.get("/rooms/#{room_id}/users", headers: @headers)
      response.parsed_response.map{ |user| User.new(user) }
    end

    def rooms_channels(room_id)
      response = self.class.get("/rooms/#{room_id}/channels", headers: @headers)
      response.parsed_response
    end

    def join_room(uri)
      response = self.class.post('/rooms', headers: @headers, query: {uri: uri})
      Room.new(response.parsed_response)
    end

    def list_messages(room_id, params={})
      response = self.class.get("/rooms/#{room_id}/chatMessages", headers: @headers, query: params)
      response.parsed_response.map{ |message| Message.new(message) }
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
      response = self.class.get('/user', headers: @headers)
      # There's only one user in the array
      User.new(response.parsed_response[0])
    end

    def user_rooms(user_id)
      response = self.class.get("/user/#{user_id}/rooms", headers: @headers)
      response.parsed_response.map{ |room| Room.new(room) }
    end

    def mark_as_read(user_id, room_id)
      response = self.class.post("/user/#{user_id}/rooms/#{room_id}/unreadItems", headers: @headers)
      response.parsed_response
    end

    def user_orgs(user_id)
      response = self.class.get("/user/#{user_id}/orgs", headers: @headers)
      response.parsed_response.map{ |org| Organization.new(org) }
    end

    def user_repos(user_id)
      response = self.class.get("/user/#{user_id}/repos", headers: @headers)
      response.parsed_response
    end

    def user_channels(user_id)
      response = self.class.get("/user/#{user_id}/channels", headers: @headers)
      response.parsed_response.map{ |channel| Channel.new(channel) }
    end
  end
end
