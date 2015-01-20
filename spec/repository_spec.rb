require 'spec_helper'

describe Gittr::Repository do

  subject(:repository){Gittr::Repository.new({"id"=>29428880, "name"=>"zoso10/Gittr", "description"=>"Gitter REST API wrapper", "uri"=>"zoso10/Gittr", "private"=>false, "room"=> {"id"=>"54bc01e3db8155e6700ecbca", "name"=>"zoso10/Gittr", "topic"=>"Gitter REST API wrapper", "uri"=>"zoso10/Gittr", "oneToOne"=>false, "userCount"=>1, "unreadItems"=>0, "mentions"=>0, "lurk"=>false, "url"=>"/zoso10/Gittr", "githubType"=>"REPO", "security"=>"PUBLIC", "premium"=>false, "noindex"=>false}, "exists"=>true, "avatar_url"=>"https://avatars.githubusercontent.com/u/1211946?v=3"})} 
  it 'should instantiate from hash' do
    expect(repository).to_not be_nil
    expect(repository.name).to eq('zoso10/Gittr')
    expect(repository.uri).to eq('zoso10/Gittr')
    expect(repository.private).to eq(false)
    expect(repository.room.name).to eq('zoso10/Gittr')
  end
end
