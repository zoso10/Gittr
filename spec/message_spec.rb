require 'spec_helper'

describe Gittr::Message do
  subject(:message){Gittr::Message.new({"id" => "54bd1b4a573df0f92345a00f","text" => "This is a sample message","html" => "This is a sample message","sent" => "2015-01-19T14 => 57 => 14.492Z","editedAt" => nil,"fromUser" => {"id" => "54b7df5bdb8155e6700eb552","username" => "zoso10","displayName" => "Tyler Ewing","url" => "/zoso10","avatarUrlSmall" => "https => //avatars.githubusercontent.com/u/1211946?v=3&s=60","avatarUrlMedium" => "https => //avatars.githubusercontent.com/u/1211946?v=3&s=128"},"unread" => false,"readBy" => 0,"urls" => [],"mentions" => [],"issues" => [],"meta" => {},"v" => 1})}

  it 'should instantiate from hash' do
    expect(message.text).to eq('This is a sample message')
    expect(message.unread).to eq(false)
    expect(message.from_user.username).to eq('zoso10')
    expect(message.from_user.display_name).to eq('Tyler Ewing')
  end
end


