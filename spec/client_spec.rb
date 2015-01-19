require 'spec_helper'

describe Gittr::Client do
  subject(:client) { Gittr::Client.new('redacted') }

  it 'should not raise an exception' do
    expect{
      Gittr.configure{ |config| config.token='asdf'}
      Gittr::Client.new
    }.not_to raise_error
    Gittr.token = nil
  end

  it 'should return rooms' do
    VCR.use_cassette('rooms') do
      rooms = client.rooms
      expect(rooms.count).to eq(1)
      expect(rooms[0].name).to eq('zoso10/skriv')
    end
  end

  it 'should return users for room 54b7e136db8155e6700eb569' do
    VCR.use_cassette('rooms_users') do
      users = client.rooms_users('54b7e136db8155e6700eb569')
      expect(users.count).to eq(2)
      expect(users[0].username).to eq('zoso10')
      expect(users[0].display_name).to eq('Tyler Ewing')
    end
  end

  it 'should return channels for room 54b7e136db8155e6700eb569' do
    VCR.use_cassette('rooms_channels') do
      users = client.rooms_channels('54b7e136db8155e6700eb569')
      expect(users.count).to eq(0)
    end
  end

  it 'should join room and be admin' do
    VCR.use_cassette('join_room') do
      room = client.join_room('zoso10/gittr')
      expect(room.name).to eq('zoso10/Gittr')
      expect(room.user_count).to eq(1)
      expect(room.users[0].username).to eq('zoso10')
      expect(room.users[0].display_name).to eq('Tyler Ewing')
      expect(room.users[0].role).to eq('admin')
    end
  end

  it 'should list messages' do
    VCR.use_cassette('list_messages') do
      room_id = '54b7e136db8155e6700eb569'
      messages = client.list_messages(room_id)
      expect(messages).to_not be_nil
      expect(messages.count).to eq(50)
      expect(messages[0]['text']).to eq('thats pretty cool')
      expect(messages[0]['fromUser']['username']).to eq('zoso10')
    end
  end

  it 'should only list 10 messages' do
    VCR.use_cassette('list_messages', record: :new_episodes) do
      room_id = '54b7e136db8155e6700eb569'
      messages = client.list_messages(room_id, limit: 10)
      expect(messages.count).to eq(10)
    end
  end

  it 'sends a message' do
    VCR.use_cassette('send_message') do
      room_id = '54b7e136db8155e6700eb569'
      text = 'This is a sample message'
      message = client.create_message(room_id, text)
      expect(message).to_not be_nil
      expect(message['text']).to eq(text)
      expect(message['fromUser']['username']).to eq('zoso10')
    end
  end

  it 'update a message' do
    VCR.use_cassette('update_message') do
      room_id = '54b7e136db8155e6700eb569'
      message_id = '54bd1b4a573df0f92345a00f'
      text = 'This message has been updated'
      message = client.update_message(room_id, message_id, text)
      expect(message).to_not be_nil
      expect(message['error']).to eq('You can no longer edit this message')
    end
  end
end
