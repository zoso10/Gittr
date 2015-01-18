require 'spec_helper'

describe Gittr::User do
  subject(:user){ Gittr::User.new({"id":"54b7df5bdb8155e6700eb552","username":"zoso10","displayName":"Tyler Ewing","url":"/zoso10","avatarUrlSmall":"https://avatars.githubusercontent.com/u/1211946?v=3&s=60","avatarUrlMedium":"https://avatars.githubusercontent.com/u/1211946?v=3&s=128","role":"admin"}) }

  it 'should instantiate from hash' do
    expect(user.username).to eq('zoso10')
    expect(user.display_name).to eq('Tyler Ewing')
    expect(user.url).to eq('/zoso10')
    expect(user.role).to eq('admin')
  end
end
