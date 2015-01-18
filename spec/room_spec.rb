require 'spec_helper'

describe Gittr::Room do
  subject(:room){Gittr::Room.new({"id":"54b7e136db8155e6700eb569","name":"zoso10/skriv","topic":"Advanced Note-Taking Application","uri":"zoso10/skriv","oneToOne":false,"userCount":2,"unreadItems":0,"mentions":0,"lastAccessTime":"2015-01-18T15:14:53.598Z","lurk":false,"url":"/zoso10/skriv","githubType":"REPO","security":"PUBLIC","premium":false,"noindex":false,"v":1})}

  it 'should instantiate from hash' do
    expect(room.name).to eq('zoso10/skriv')
    expect(room.uri).to eq('zoso10/skriv')
    expect(room.user_count).to eq(2)
  end
end
