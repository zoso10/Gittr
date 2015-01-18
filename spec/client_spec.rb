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
      expect(rooms[0]["name"]).to eq('zoso10/skriv')
    end
  end
end
