require 'spec_helper'

describe Gittr::Client do
  subject(:client) { Gittr::Client.new('redacted') }

  it 'raises an exception with no token' do
    expect{ Gittr::Client.new }.to raise_error
  end

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
end
