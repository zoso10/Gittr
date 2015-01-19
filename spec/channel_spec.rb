require 'spec_helper'

describe Gittr::Channel do
  subject(:channel){ Gittr::Channel.new({"id" => "asdf", "name" => "skriv", "uri" => "zoso10/skriv", "garbage" => "foo"}) }

  it 'should instantiate from hash' do
    expect(channel.id).to eq('asdf')
    expect(channel.name).to eq('skriv')
    expect(channel.uri).to eq('zoso10/skriv')
  end
end
