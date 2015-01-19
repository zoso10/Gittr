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
  end
end
