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
      response.parsed_response
    end

    def rooms_channels(room_id)
      response = self.class.get("/rooms/#{room_id}/channels", headers: @headers)
      response.parsed_response
    end

    def join_room(uri)
      response = self.class.post('/rooms', headers: @headers, query: {uri: uri})
      Room.new(response.parsed_response)
    end
  end
end
